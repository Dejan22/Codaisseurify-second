Song.delete_all
Artist.delete_all

parker = Artist.create(name: "Charlie Parker")

davis = Artist.create(name: "Miles Davis")

gillespie = Artist.create(name: "Dizzy Gillespie")

jamal = Artist.create(name: "Ahmad Jamal")

dave = Artist.create(name: "Dave Brubeck")

james = Artist.create(name: "James Carter")

song1 = Song.create(title: "Autumn in New York")

song2 = Song.create(title: "Relaxin' at Camarillo")

song3 = Song.create(title: "Parker's Mood")

song4 = Song.create(title: "So What")

song5 = Song.create(title: "Flamenco Sketches")

song6 = Song.create(title: "'Round Midnight")

song7 = Song.create(title: "Blues 'N' Boogie")

song8 = Song.create(title: "'Groovin' High")

song9 = Song.create(title: "Desafinado")

song10 = Song.create(title: "Ahmad's Blues")

song11 = Song.create(title: "But Not For Me")

song12 = Song.create(title: "Old Devil Moon")

song13 = Song.create(title: "Blue Rondo a la Turk")

song14 = Song.create(title: "Strange Meadow Lark")

song15 = Song.create(title: "Take Five")

song16 = Song.create(title: "Free Reaggae HiBop")

song17 = Song.create(title: "Parker's Mood")

parker.songs << [song1, song2, song3]
parker.save

davis.songs << [song4, song5, song6]
davis.save

gillespie.songs << [song7, song8, song9]
gillespie.save

jamal.songs << [song10, song11, song12]
jamal.save

dave.songs << [song13, song14, song15]
dave.save

james.songs << [song16, song17]
james.save
