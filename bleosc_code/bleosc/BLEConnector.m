#import "BLEConnector.h"
#import <CoreBluetooth/CoreBluetooth.h>

@interface BLEConnector() <CBCentralManagerDelegate, CBPeripheralDelegate>

@property (nonatomic, strong) CBCentralManager* manager;
@property (nonatomic, strong) CBPeripheral* peripheral;

@property (nonatomic, strong) CBUUID* serviceUUID;

@end

@implementation BLEConnector

- (instancetype)init {
    self = [super init];
    if (self) {
        self.manager = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
        
//        self.serviceUUID = [CBUUID UUIDWithString:@"180D"];
        self.serviceUUID = [CBUUID UUIDWithString:@"84F20AFF-A73A-4FE6-850B-BDED53F7AC2A"];
        
        
    }
    return self;
}

- (void)start {
    // TODO: broadcast properly from BLE device the correct UUID in advertisiment
//    [self.manager scanForPeripheralsWithServices:nil options:nil];
    [self.manager scanForPeripheralsWithServices:@[ self.serviceUUID ] options:nil];
}

#pragma mark - CBPeripheral Delegate
- (void)peripheral:(CBPeripheral*)peripheral didDiscoverServices:(NSError *)error {
    for (CBService* service in peripheral.services) {
        NSLog(@"Service found with UUID: %@", service.UUID);
        
        // only interested in our special serviec
        if ([service.UUID isEqual:self.serviceUUID]) {
            [peripheral discoverCharacteristics:nil forService:service];
        }
    }
}

- (void)peripheral:(CBPeripheral*)peripheral didDiscoverCharacteristicsForService:(CBService*)service error:(NSError*)error {
    if ([service.UUID isEqual:self.serviceUUID]) {
        
        for (CBCharacteristic *character in service.characteristics) {
            if ([character.UUID isEqual:[CBUUID UUIDWithString:@"0002"]]) {
                [peripheral setNotifyValue:YES forCharacteristic:character];
            }
        }
        
    }
}

- (void) peripheral:(CBPeripheral *)aPeripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error {
    
    if ([characteristic.UUID isEqual:[CBUUID UUIDWithString:@"2A37"]]) {
        if (characteristic.value || !error) {
            
            NSData* data =characteristic.value;
            
            const uint8_t *reportData = [data bytes];
            uint16_t bpm = 0;
            
            if ((reportData[0] & 0x01) == 0)
            {
                /* uint8 bpm */
                bpm = reportData[1];
            }
            else
            {
                /* uint16 bpm */
                bpm = CFSwapInt16LittleToHost(*(uint16_t *)(&reportData[1]));
            }
            
            NSLog(@"VALUE: %hu", bpm);
            
        }
    }
    
}

#pragma mark - CBCentralManager Delegate
- (void)centralManagerDidUpdateState:(CBCentralManager *)central {
    self.shouldExit = ![self isLECapableHardware];
}

- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)aPeripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI {
    
    // HACK: assuming there is only one
    NSLog(@"%@", aPeripheral);
    
    // attemp to connect
    self.peripheral = aPeripheral;
    [self.manager connectPeripheral:self.peripheral options:nil];
    
    [self.manager stopScan];
}

- (void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral {
    // found our target
    self.peripheral = peripheral;
    [self.peripheral setDelegate:self];
    [self.peripheral discoverServices:nil]; // start scanning for published services
}

- (void)centralManager:(CBCentralManager *)central didDisconnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error {
    NSLog(@"DISCONNECTED: %@", peripheral);
}

- (void)centralManager:(CBCentralManager *)central didFailToConnectPeripheral:(CBPeripheral *)aPeripheral error:(NSError *)error {
    NSLog(@"ERROR: %@", error);
}

#pragma mark - Utils
- (BOOL)isLECapableHardware {
    NSString * state = nil;
    switch ([self.manager state]) {
        case CBCentralManagerStateUnsupported:
            state = @"The platform/hardware doesn't support Bluetooth Low Energy.";
            break;
        case CBCentralManagerStateUnauthorized:
            state = @"The app is not authorized to use Bluetooth Low Energy.";
            break;
        case CBCentralManagerStatePoweredOff:
            state = @"Bluetooth is currently powered off.";
            break;
        case CBCentralManagerStatePoweredOn:
            return TRUE;
        case CBCentralManagerStateUnknown:
        default:
            return FALSE;
            
    }
    
    NSLog(@"Cannot currently use BLE: %@", state);
    
    return FALSE;
}

@end
