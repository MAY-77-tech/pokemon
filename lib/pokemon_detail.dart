import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokemon/pokemon.dart';

class PokemonDetail extends StatelessWidget {
  final Pokemon pokemon; //obj

  PokemonDetail({this.pokemon});

 
  bodyWidget(BuildContext context)  => Stack(children: [
      Positioned(
        height: MediaQuery.of(context).size.height / 1.5,
        width: MediaQuery.of(context).size.width - 20,
        left: 10.0, //left Margin
        top: MediaQuery.of(context).size.height * 0.1, //0.1 = 10%
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: 70.0,
              ),
              Text(
                pokemon.name,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              Text("Height: ${pokemon.height}"),
              Text("Weight: ${pokemon.weight}"),
              Text(
                "Type",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: pokemon.type
                    .map((e) => FilterChip(
                            backgroundColor: Colors.amber,
                            label: Text(e),
                            onSelected: (b) {}) //b=boolean
                        )
                    .toList(),
              ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.weaknesses.map((e) => 
                  FilterChip(
                    backgroundColor: Colors.red,
                    label: Text(
                      e,
                      style: TextStyle(color: Colors.white),
                    ), 
                    onSelected: (b){})                 
                  ).toList()
                ),

                Text(

                  "Next Evolution", style: TextStyle(fontWeight: FontWeight.bold)
                
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.nextEvolution == null 
                  ?[Text("This is the final form")]
                  :pokemon.nextEvolution.map((e)=>
                  FilterChip(
                    backgroundColor: Colors.green,
                    label: Text(e.name,
                    style: TextStyle(
                      color: Colors.white
                    ),
                    ), 
                    onSelected:(b){} )).toList()
                ),
                
            ],
          ),
        ),
      ),

      Align(alignment: Alignment.topCenter,
      child: Hero(
        tag: pokemon.img, 
        child: Image.network(
          pokemon.img,
          fit: BoxFit.cover,
          width: 200,
          height: 200,
        ),
        ),
      ),
    ]);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyan,
        appBar: AppBar(
          elevation: 1.0,
          backgroundColor: Colors.greenAccent,
          title: Text(pokemon.name),
        ),
        body: bodyWidget(context),
    );
  } //obj
}
