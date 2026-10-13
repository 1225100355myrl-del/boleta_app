import 'package:flutter/material.dart';
import '../models/materia_model.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static final List<MateriaModel> listaMaterias = [
    MateriaModel(
      nombre: 'Matemáticas',
      profesor: 'Prof. Carlos Gómez',
      calificacion: 9.5,
      descripcion: 'Álgebra avanzada, ecuaciones y resolución de problemas lógicos.',
      imagenUrl: 'https://images.unsplash.com/photo-1509228468518-180dd4864904?w=500',
    ),
    MateriaModel(
      nombre: 'Historia',
      profesor: 'Profra. María López',
      calificacion: 8.8,
      descripcion: 'Historia universal contemporánea y eventos mundiales clave.',
      imagenUrl: 'https://images.unsplash.com/photo-1461360370896-922624d12aa1?w=500',
    ),
    MateriaModel(
      nombre: 'Ciencias Naturales',
      profesor: 'Dr. Roberto Sánchez',
      calificacion: 9.2,
      descripcion: 'Biología celular, ecosistemas y el cuerpo humano.',
      imagenUrl: 'https://images.unsplash.com/photo-1532094349884-543bc11b234d?w=500',
    ),
    MateriaModel(
      nombre: 'Literatura',
      profesor: 'Profra. Ana Torres',
      calificacion: 9.0,
      descripcion: 'Análisis literario, redacción de ensayos y obras clásicas.',
      imagenUrl: 'https://images.unsplash.com/photo-1457369804613-52c61a468e7d?w=500',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Suma y cálculo del promedio general de las calificaciones
    double sumaCalificaciones = listaMaterias.fold(0, (sum, item) => sum + item.calificacion);
    double promedioGeneral = sumaCalificaciones / listaMaterias.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Boleta Escolar'),
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Perfil del Alumno: Juanito Pérez')),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.indigo.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.indigo.shade200),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Promedio General',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.indigo),
                    ),
                    SizedBox(height: 4),
                    Text('Ciclo Escolar Actual', style: TextStyle(color: Colors.grey)),
                  ],
                ),
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.indigo,
                  child: Text(
                    promedioGeneral.toStringAsFixed(1),
                    style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Materias cursadas:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: listaMaterias.length,
              itemBuilder: (context, index) {
                final materia = listaMaterias[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  elevation: 3,
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        materia.imagenUrl,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      materia.nombre,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Prof: ${materia.profesor}'),
                    trailing: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: materia.calificacion >= 9.0 ? Colors.green.shade100 : Colors.orange.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        materia.calificacion.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: materia.calificacion >= 9.0 ? Colors.green.shade800 : Colors.orange.shade800,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(materia: materia),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}