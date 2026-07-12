import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notifikasi"), centerTitle: true),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.local_offer, color: Colors.red),
            title: Text("Promo Tiket Online"),
            subtitle: Text(
              "Nikmati diskon hingga 20% untuk pembelian tiket melalui aplikasi.",
            ),
            trailing: Text("2 jam", style: TextStyle(fontSize: 12)),
          ),
          Divider(height: 1),

          ListTile(
            leading: Icon(Icons.attractions, color: Colors.orange),
            title: Text("Halilintar Sedang Ramai"),
            subtitle: Text("Estimasi waktu antrean saat ini sekitar 15 menit."),
            trailing: Text("10 mnt", style: TextStyle(fontSize: 12)),
          ),
          Divider(height: 1),

          ListTile(
            leading: Icon(Icons.celebration, color: Colors.purple),
            title: Text("Fireworks Show Malam Ini"),
            subtitle: Text("Pertunjukan kembang api dimulai pukul 20.00 WIB."),
            trailing: Text("Hari ini", style: TextStyle(fontSize: 12)),
          ),
          Divider(height: 1),

          ListTile(
            leading: Icon(Icons.hotel, color: Colors.blue),
            title: Text("Mercure Convention Center"),
            subtitle: Text("Kamar masih tersedia mulai Rp980.000 per malam."),
            trailing: Text("Kemarin", style: TextStyle(fontSize: 12)),
          ),
          Divider(height: 1),

          ListTile(
            leading: Icon(Icons.favorite, color: Colors.pink),
            title: Text("Reservasi Wedding"),
            subtitle: Text(
              "Permintaan reservasi Garden Wedding sedang diproses.",
            ),
            trailing: Text("2 hari", style: TextStyle(fontSize: 12)),
          ),
          Divider(height: 1),

          ListTile(
            leading: Icon(Icons.school, color: Colors.green),
            title: Text("Study Tour Dibuka"),
            subtitle: Text(
              "Program School Fun Trip kini dapat dipesan secara online.",
            ),
            trailing: Text("3 hari", style: TextStyle(fontSize: 12)),
          ),
          Divider(height: 1),

          ListTile(
            leading: Icon(Icons.info, color: Colors.teal),
            title: Text("Theater Musical Show"),
            subtitle: Text(
              "Jangan lewatkan pertunjukan spesial akhir pekan ini.",
            ),
            trailing: Text("4 hari", style: TextStyle(fontSize: 12)),
          ),
          Divider(height: 1),

          ListTile(
            leading: Icon(Icons.water, color: Colors.cyan),
            title: Text("Niagara Gara"),
            subtitle: Text(
              "Antrean lebih singkat dari biasanya. Saat yang tepat untuk mencoba!",
            ),
            trailing: Text("5 hari", style: TextStyle(fontSize: 12)),
          ),
        ],
      ),
    );
  }
}
