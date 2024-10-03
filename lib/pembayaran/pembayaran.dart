import 'package:flutter/material.dart';
import 'package:kuis_prakmobile/login/login_pages.dart';
// import 'package:modul3/presentation/authentication/login_pages.dart';

class Pembayaran extends StatelessWidget {
   String nama = "";
   String email = "";
   String totalkamar = "";
   String totalmalam = "";
   String harga;

   Pembayaran({super.key,
      required this.nama,
      required this.email,
      required this.totalkamar,
      required this.totalmalam,
      required this.harga,
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 24,
        ),
        child: Center(
          child: Column(
            children: [
              Text('Payment Information',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text('Fullname:  $nama',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Email:  $email',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Total Room:  $totalkamar',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Total Night:  $totalmalam',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 36,
              ),
              Text(
                "Price:  $harga",
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 36,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                   ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      backgroundColor: Colors.green,
      content: Text('Pembayaran berhasil!!'),
    ),
  );
                    },
                    child: Text("Pay Now"),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 18,

                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}