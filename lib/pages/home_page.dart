import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/song_model.dart';
import '../providers/audio_player_provider.dart';
import 'now_playing_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final audioProvider = Provider.of<AudioPlayerProvider>(context);

    final List<Song> songs = [
      Song(
        title: "GIMS - Naïf (Audio Officiel)",
        artist: "GIMS",
        url: "assets/naif.mp3",
        image: "assets/images/gims1.jfif",
      ),
      Song(
        title: "GIMS - NINAO (Clip officiel)",
        artist: "GIMS",
        url: "assets/ninao.mp3",
        image: "assets/images/gims2.jfif",
      ),
         Song(
        title: "GIMS & Jul - AIR FORCE BLANCHE",
        artist: "GIMS & Jul",
        url: "assets/airforce.mp3",
        image: "assets/images/gims3.jfif",
      ),
         Song(
        title: "GIMS - Bella ",
        artist: "GIMS",
        url: "assets/bella.mp3",
        image: "assets/images/gims4.jfif",
      ),
         Song(
        title: "GIMS - Brisé",
        artist: "GIMS",
        url: "assets/brise.mp3",
        image: "assets/images/gims5.jfif",
      ),
         Song(
        title: "GIMS - Caméléon ",
        artist: "GIMS",
        url: "assets/cameleon.mp3",
        image: "assets/images/gims6.jfif",
      ),
         Song(
        title: "GIMS - Changer ",
        artist: "GIMS",
        url: "assets/changer.mp3",
        image: "assets/images/gims7.jfif",
      ),
         Song(
        title: "GIMS - CIEL ",
        artist: "GIMS",
        url: "assets/ciel.mp3",
        image: "assets/images/gims8.jfif",
      ),
         Song(
        title: "GIMS - COMÈTE ",
        artist: "GIMS",
        url: "assets/comete.mp3",
        image: "assets/images/gims9.jfif",
      ),
         Song(
        title: "GIMS - CONTACT",
        artist: "GIMS",
        url: "assets/contact.mp3",
        image: "assets/images/gims10.jfif",
      ),
         Song(
        title: "GIMS - APPELLE TA COPINE ",
        artist: "GIMS",
        url: "assets/copine.mp3",
        image: "assets/images/gims11.jfif",
      ),
         Song(
        title: "GIMS - Corazon ft. Lil Wayne & French Montana",
        artist: "GIMS & Lil Wayne & French Montana",
        url: "assets/corazon.mp3",
        image: "assets/images/gims12.jfif",
      ),
         Song(
        title: "GIMS - Epuisé",
        artist: "GIMS",
        url: "assets/epuise.mp3",
        image: "assets/images/gims13.jfif",
      ),
         Song(
        title: "GIMS - HORIZON",
        artist: "GIMS",
        url: "assets/horizone.mp3",
        image: "assets/images/gims14.jfif",
      ),
         Song(
        title: "GIMS - Jasmine ",
        artist: "GIMS",
        url: "assets/jasmine.mp3",
        image: "assets/images/gims15.jfif",
      ),
         Song(
        title: "GIMS & Lossa - LOCO",
        artist: "GIMS & Loussa  ",
        url: "assets/loco.mp3",
        image: "assets/images/gims16.jfif",
      ),
         Song(
        title: "GIMS - Est-ce que tu m'aimes ?",
        artist: "GIMS",
        url: "assets/maime.mp3",
        image: "assets/images/gims17.jfif",
      ),
         Song(
        title: "GIMS - Mi Gna ft. Super Sako, Hayko",
        artist: "GIMS & Super Sako & Hayko",
        url: "assets/migna.mp3",
        image: "assets/images/gims18.jfif",
      ),
         Song(
        title: "GIMS - Lo Mismo ft. Alvaro Soler",
        artist: "GIMS",
        url: "assets/mismo.mp3",
        image: "assets/images/gims1.jfif",
      ),
         Song(
        title: "Soolking ft. GIMS - CARRÉ OK ",
        artist: "GIMS & Soolking",
        url: "assets/ok.mp3",
        image: "assets/images/gims13.jfif",
      ),

     Song(
        title: "GIMS - Laissez passer",
        artist: "GIMS",
        url: "assets/passer.mp3",
        image: "assets/images/gims3.jfif",
      ),

     Song(
        title: "GIMS - Mon coeur avait raison (pilule bleue)",
        artist: "GIMS",
        url: "assets/raison.mp3",
        image: "assets/images/gims10.jfif",
      ),
     Song(
        title: "GIMS & Sting - Reste ",
        artist: "GIMS & Sting",
        url: "assets/reste.mp3",
        image: "assets/images/gims7.jfif",
      ),
     Song(
        title: "GIMS, Maluma - Hola Señorita ",
        artist: "GIMS & Maluma",
        url: "assets/senirota.mp3",
        image: "assets/images/gims14.jfif",
      ),
     Song(
        title: "MORAD & GIMS - SEYA ",
        artist: "GIMS & Morad",
        url: "assets/seya.mp3",
        image: "assets/images/gims3.jfif",
      ),
     Song(
        title: "GIMS & DYSTINCT - SPIDER",
        artist: "GIMS & Dystinct",
        url: "assets/spider.mp3",
        image: "assets/images/gims8.jfif",
      ),
     Song(
        title: "GIMS & Dadju - Terminal 2F",
        artist: "GIMS & Dadju",
        url: "assets/terminal.mp3",
        image: "assets/images/gims6.jfif",
      ),
     Song(
        title: "GIMS - SOIS PAS TIMIDE",
        artist: "GIMS",
        url: "assets/timide.mp3",
        image: "assets/images/gims16.jfif",
      ),
     Song(
        title: "GIMS - J'me tire",
        artist: "GIMS",
        url: "assets/tire.mp3",
        image: "assets/images/gims13.jfif",
      ),
     Song(
        title: "GIMS & KEBLACK - TOUCHÉ",
        artist: "GIMS & Keblack",
        url: "assets/touche.mp3",
        image: "assets/images/gims18.jfif",
      ),
  Song(
        title: "GIMS - Tout donner",
        artist: "GIMS",
        url: "assets/tout donnner.mp3",
        image: "assets/images/gims12.jfif",
      ),
        Song(
        title: "GIMS - JUSQU'ICI TOUT VA BIEN ",
        artist: "GIMS",
        url: "assets/va bien.mp3",
        image: "assets/images/gims1.jfif",
      ),

      // Add more songs here...
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("🎵 GIMS Music"),
        backgroundColor: Colors.black87,
      ),
      body: Stack(
        children: [
          // 🎨 Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.jfif"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 🔲 Song list over dark background
          Container(
            color: Colors.black.withOpacity(0.6),
            child: ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) {
                final song = songs[index];

                return ListTile(
                  leading: Image.asset(
                    song.image,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(song.title, style: const TextStyle(color: Colors.white)),
                  subtitle: Text(song.artist, style: const TextStyle(color: Colors.white70)),
                  onTap: () async {
                    if (audioProvider.currentIndex != index) {
                      await audioProvider.play(song.url, index, songs.map((s) => s.url).toList());

                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NowPlayingPage(
    songList: songs,
    index: index,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
