// import 'dart:io';

import 'package:dart_periphery/dart_periphery.dart';
import 'package:flutter/foundation.dart';

class I2cBme280GetData {
  var i2c = I2C(1);
  String temperature = '';
  String humidity = '';
  String pressure = '';
  // ignore: prefer_typing_uninitialized_variables
  var bme280;

  void initI2cBme280() {
    // Select the right I2C bus number /dev/i2c-?
    // 1 for Raspberry Pi, 0 for NanoPi (Armbian), 2 Banana Pi (Armbian)
    var i2c = I2C(1);
    debugPrint('I2C info:${i2c.getI2Cinfo()}');
    bme280 = BME280(i2c);
  }

  String getI2CBme280Temperature() {
    var r = bme280.getValues();
    temperature = r.temperature.toStringAsFixed(1);
    debugPrint('In get temp: $temperature');
    return temperature;
  }

  String getI2CBme280Humidity() {
    var r = bme280.getValues();
    humidity = r.humidity.toStringAsFixed(1);
    return humidity;
  }

  String getI2CBme280Pressure() {
    var r = bme280.getValues();
    pressure = r.pressure.toStringAsFixed(1);
    return pressure;
  }

  void i2CBme280Displose() {
    i2c.dispose();
  }
}
