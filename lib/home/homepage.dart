import 'package:flutter/material.dart';
import 'package:kuis_prakmobile/pemesanan/pemesanan.dart';
// import 'package:tugas2/profile/profile.dart';
// import 'package:tugas2/details/detail_produk.dart';

class HomePage extends StatefulWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(   
        title: const Text("Blue Doorz",),
        backgroundColor: const Color.fromARGB(255, 17, 27, 51),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
    child: Column(
    children: [
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            SizedBox(height: 20), // Tambahkan ruang kosong di atas SingleChildScrollView
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Image.asset('assets/logo.png', width: 50,),
                ),
              ],
            ),
          ],
        ),
      ),
            Text(
              "Hai, ${widget.username} Welcome To Blue Doorz",
              textAlign: TextAlign.left,
              style: const TextStyle(fontSize: 18),
            ),
 GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 3,
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
    childAspectRatio: 1,
  ),
  itemCount: 10,
  shrinkWrap: true,
  physics: NeverScrollableScrollPhysics(),
  itemBuilder: (context, index) {
    return Card(
      child: Column(
        children: [
          Expanded(
            child: Image.asset('assets/hotel.jpg'), // Ganti dengan gambar produk
          ),
          Text('Blue Lagoon'), 
          SizedBox(height: 10,),// Ganti dengan nama produk
          Row(
            children: [
              Expanded(
                child: Text('Rp 500.000/Night',textAlign: TextAlign.center,), // Ganti dengan harga produk
              ),
              SizedBox(height: 10,),
              SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    // Fungsi tombol beli
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Pemesanan(username: 'username',)),
                    );
                  },
                  child: Text('Beli'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(0, 30), // Atur ukuran tombol
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  },
)
          ],
        ),
      ),
    );
  }
}