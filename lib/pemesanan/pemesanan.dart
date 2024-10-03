import 'package:flutter/material.dart';
import 'package:kuis_prakmobile/pembayaran/pembayaran.dart';

class Pemesanan extends StatefulWidget {
  final String username;
  const Pemesanan({super.key, required this.username});

  @override
  State<Pemesanan> createState() => _Pemesanan();
}

class _Pemesanan extends State<Pemesanan> {
  String _namaLengkap = "";
  String _email = "";
  String _totalKamar = "";
  String _totalMalam = "";
  String harga = "500000";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blue Lagoon"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          child: Column(
            children: [
              Container(
                  width: 350,
                  height: 200,
                  alignment: Alignment.center,
                  child: Image.asset('assets/hotel.jpg'), // Ganti dengan gambar 1
                ),
              const SizedBox(height: 24),
              const Text("Blue Lagoon",
              textAlign: TextAlign.left,),
               Text("Rp500.000/night",style: TextStyle(color: Colors.red,)), 
               Text("Booking Information",), 
              _buildForm(),
              const SizedBox(height: 12),
              _buildButtonSubmit(),
            ],
          ),
        ),
      );
  }

  Widget _formInput(
      {required String hint,
      required String label,
      required Function(String value) setStateInput,
      int maxLines = 1}) {
    return TextFormField(
      enabled: true,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: const EdgeInsets.all(12.0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.blue),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
      onChanged: setStateInput,
    );
  }

  Widget _buildForm() {
    return Column(
      children: [
        const SizedBox(height: 12),
        _formInput(
            hint: "Fullname",
            label: "Fullname *",
            setStateInput: (value) {
              setState(() {
                _namaLengkap = value;
              });
            }),
        const SizedBox(height: 12),
        _formInput(
            hint: "Email",
            label: "Email *",
            setStateInput: (value) {
              setState(() {
                _email = value;
              });
            }),
        const SizedBox(height: 12),
        _formInput(
            hint: "Total Room",
            label: "Total Room *",
            setStateInput: (value) {
              setState(() {
                _totalKamar = value;
              });
            }),
        const SizedBox(height: 12),
        _formInput(
          hint: "Total Night",
          label: "Total Night *",
          setStateInput: (value) {
            setState(
              () {
                _totalMalam = value;
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildButtonSubmit() {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          if (_namaLengkap == "" || _email == "" || _totalKamar == "" || _totalMalam == "") {
            SnackBar snackBar = const SnackBar(
              content: Text("* data tidak boleh kosong"),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Pembayaran(
                  nama: _namaLengkap,
                  email: _email,
                  totalkamar: _totalKamar,
                  totalmalam: _totalMalam,
                  harga: harga);
            }));
          }
        },
        child: Text("Submit"),
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0)),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            textStyle: const TextStyle(fontSize: 16)),
      ),
    );
  }
}