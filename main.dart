import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF556B2F),
        scaffoldBackgroundColor: Color(0xFF556B2F),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildButton(context, "OBD 2", OBD2Dashboard()),
            SizedBox(width: 20),
            _buildButton(context, "Sans OBD", DiagnosticScreen()),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, Widget screen) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(text),
    );
  }
}



class OBD2Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text(
                  "Diagnostic",
                  style: GoogleFonts.pacifico(
                    fontSize: 28,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10),

                // Wrench Icon
                Icon(
                  FontAwesomeIcons.wrench,
                  size: 50,
                  color: Colors.orangeAccent,
                ),
                SizedBox(width: 10),

                // "Auto" Text
                Text(
                  "Auto",
                  style: GoogleFonts.pacifico(
                    fontSize: 28,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Grid of Status Cards
            Expanded(
              child: GridView.count(
                crossAxisCount: 3, //
                childAspectRatio: 1.2,
                children: [
                  _buildStatusCard(FontAwesomeIcons.carBattery, "Tension de batterie", "12 V"),
                  _buildStatusCard(FontAwesomeIcons.tachometerAlt, "RPM", "2500 tr/min"),
                  _buildStatusCard(FontAwesomeIcons.cogs, "Charge moteur", "70%"),
                  _buildStatusCard(FontAwesomeIcons.gasPump, "Pression du carburant", "10 kPa"),
                  _buildStatusCard(FontAwesomeIcons.temperatureHigh, "Liquide de refroidissement", "70°C"),
                  _buildStatusCard(FontAwesomeIcons.wind, "Débit massique d'air", "200 g/s"),
                  _buildStatusCard(FontAwesomeIcons.exclamationTriangle, "Les codes défauts", "p0420"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusCard(IconData icon, String label, String value) {
    return Card(
      color: Colors.black54,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.greenAccent, size: 30),
            SizedBox(height: 8),
            Text(label, style: TextStyle(color: Colors.white, fontSize: 16)),
            if (value.isNotEmpty) 
              Text(value, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

class DiagnosticScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("This is the Diagnostic Screen")),
    );
  }
}