#import "BLEConnector.h"
#import <CoreBluetooth/CoreBluetooth.h>

@interface BLEConnector() <CBCentralManagerDelegate, CBPeripheralDelegate>

@property (nonatomic, strong) CBCentralManager* manager;
@property (nonatomic, strong) CBPeripheral* peripheral;

@property (nonatomic, strong) CBUUID* serviceUUID;
@property (nonatomic, strong) CBUUID* batteryServiceUUID;
@property (nonatomic, strong) CBUUID* batteryLevelCharacteristic;

@property (nonatomic, strong) NSMutableDictionary* descriptions;
@property (nonatomic, strong) NSMutableDictionary* formats;

@end

@implementation BLEConnector

- (instancetype)initWithTargetServiceUUID:(NSString*)uuid {
    self = [super init];
    if (self) {
        self.manager = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
        self.serviceUUID = [CBUUID UUIDWithString:uuid];
        
        self.descriptions = [NSMutableDictionary dictionary];
        self.formats = [NSMutableDictionary dictionary];
        
        self.batteryServiceUUID = [CBUUID UUIDWithString:@"180F"];
        self.batteryLevelCharacteristic = [CBUUID UUIDWithString:@"2A1B"];
    }
    return self;
}

- (void)connect {
    // only look for advertised service
    [self.manager scanForPeripheralsWithServices:@[ self.serviceUUID ] options:nil];
}

#pragma mark - CBPeripheral Delegate
- (void)peripheral:(CBPeripheral*)peripheral didDiscoverServices:(NSError *)error {
    for (CBService* service in peripheral.services) {
        // only interested in the original service we started looking for
        if ([service.UUID isEqual:self.serviceUUID]) {
            [peripheral discoverCharacteristics:nil forService:service];
        } else if ([service.UUID isEqual:self.batteryServiceUUID]) {
            [peripheral discoverCharacteristics:nil forService:service];
        }
    }
}

- (void)peripheral:(CBPeripheral*)peripheral didDiscoverCharacteristicsForService:(CBService*)service error:(NSError*)error {
    if ([service.UUID isEqual:self.serviceUUID]) {
        for (CBCharacteristic *character in service.characteristics) {
            
            NSLog(@"Characteristic found with UUID: %@", character.UUID);
            [peripheral discoverDescriptorsForCharacteristic:character];
            [peripheral setNotifyValue:YES forCharacteristic:character];
            
        }
        
    } else if ([service.UUID isEqual:self.batteryServiceUUID]) {
        for (CBCharacteristic *character in service.characteristics) {
        
            NSLog(@"Characteristic found with UUID: %@", character.UUID);
            [peripheral setNotifyValue:YES forCharacteristic:character];
        
        }
    }
}

- (void)peripheral:(CBPeripheral *)peripheral didDiscoverDescriptorsForCharacteristic:(CBCharacteristic *)characteristic error:(nullable NSError *)error {
    for (CBDescriptor *desc in characteristic.descriptors) {
        // extract value - will fire callback
        [peripheral readValueForDescriptor:desc];
    }
}

- (void)peripheral:(CBPeripheral *)peripheral didUpdateValueForDescriptor:(CBDescriptor *)descriptor error:(NSError *)error {
    if ([descriptor.UUID isEqual:[CBUUID UUIDWithString:CBUUIDCharacteristicUserDescriptionString]]) {
        NSLog(@"Found description \"%@\" for %@", descriptor.value, descriptor.characteristic.UUID);
        self.descriptions[descriptor.characteristic.UUID] = descriptor.value;
    } else if ([descriptor.UUID isEqual:[CBUUID UUIDWithString:CBUUIDCharacteristicFormatString]]) {
        // grab format char
        const uint8_t* data = [descriptor.value bytes];
        NSLog(@"Found format %u for %@", data[0], descriptor.characteristic.UUID);
        self.formats[descriptor.characteristic.UUID] = @(data[0]);
    }
}

- (void)peripheral:(CBPeripheral *)aPeripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error {
    if (!characteristic.value || error) {
        NSLog(@"ERROR getting value update from characteristic: %@", error.localizedDescription);
        return;
    }
    
    if ([characteristic.UUID isEqual:self.batteryLevelCharacteristic]) {
        // BATTERTY LEVEL
        // uint8
        const uint8_t* data = [characteristic.value bytes];
        int level = data[0];
        [self.delegate connectorDidUpdateBatteryLevel:level];
    } else {
        NSString* description = self.descriptions[characteristic.UUID];
        NSNumber* format = self.formats[characteristic.UUID];
        if (format && description) {
            
            NSLog(@"PROC value for %@ - %@", description, format);
            const uint8_t* data = [characteristic.value bytes];
            uint16_t value = data[1] << 8 | data[0];
//            NSLog(@"%ld", value);
            [self.delegate connectorDidUpdateValue:value forDescription:description];
            
        } else {
            NSLog(@"No description/format registered for %@ - unable to process", characteristic.UUID);
        }
    }
    
    
    // TODO: have no clue how to unwrap large arrays!!!
    
    
//    if ([characteristic.UUID isEqual:[CBUUID UUIDWithString:@"2A37"]]) {
//        if (characteristic.value || !error) {
//            
//            NSData* data =characteristic.value;
//            
//            const uint8_t *reportData = [data bytes];
//            uint16_t bpm = 0;
//            
//            if ((reportData[0] & 0x01) == 0)
//            {
//                /* uint8 bpm */
//                bpm = reportData[1];
//            }
//            else
//            {
//                /* uint16 bpm */
//                bpm = CFSwapInt16LittleToHost(*(uint16_t *)(&reportData[1]));
//            }
//            
//            NSLog(@"VALUE: %hu", bpm);
//            
//        }
//    }
    
}

#pragma mark - CBCentralManager Delegate
- (void)centralManagerDidUpdateState:(CBCentralManager *)central {
    if (![self isLECapableHardware])
        [self.delegate connectorDidError];
}

- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)aPeripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI {
    
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
    [self.delegate connectorDidError];
}

- (void)centralManager:(CBCentralManager *)central didFailToConnectPeripheral:(CBPeripheral *)aPeripheral error:(NSError *)error {
    NSLog(@"ERROR: %@", error);
    [self.delegate connectorDidError];
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
