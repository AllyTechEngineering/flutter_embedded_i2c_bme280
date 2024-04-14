import 'package:flutter/material.dart';
import 'package:flutter_embedded_i2c_bme280/i2c_bme280/i2c_bme280_class.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final I2cBme280GetData i2cBme280GetData = I2cBme280GetData();
  String temperatureValue = '';
  String humidityValue = '';
  String pressureValue = '';
  @override
  void initState() {
    i2cBme280GetData.initI2cBme280();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('I2C BME280'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('I2C BME280'),
            SizedBox(
              height: 20.0,
            ),
            getI2cBme280Temperature(),
            SizedBox(
              height: 20.0,
            ),
            getI2cBme280Humidity(),
            SizedBox(
              height: 20.0,
            ),
            getI2cBme280Pressure(),
          ],
        ),
      ),
    );
  }

  Widget getI2cBme280Temperature() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          temperatureValue = i2cBme280GetData.getI2CBme280Temperature();
        });
      },
      child: Text('The Temperature is: $temperatureValue'),
    );
  }

  Widget getI2cBme280Humidity() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          humidityValue = i2cBme280GetData.getI2CBme280Humidity();
        });
      },
      child: Text('The Humidity is: $humidityValue'),
    );
  }

  Widget getI2cBme280Pressure() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          pressureValue = i2cBme280GetData.getI2CBme280Pressure();
        });
      },
      child: Text('The Atmospheric Pressure is: $pressureValue'),
    );
  }
}
