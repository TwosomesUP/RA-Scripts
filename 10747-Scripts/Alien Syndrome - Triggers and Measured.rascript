// Alien Syndrome
// #ID = 10747

//No Death Boss Challenges

achievement(
    title = "Mr. Mimi is no Meanie", points = 25,
    description = "Defeat The Stage 7 Boss without Dying",
    id = 73310, badge = "78623", published = "3/9/2019 9:59:33 AM", modified = "7/15/2019 2:14:20 AM",
    trigger = never(byte(0x000002) != 128) && never(byte(0x000052) != 6) && never(byte(0x0008F6) > 0) && byte(0x00007D)
               == 1 && once(byte(0x000081) == 70) && repeated(5, byte(0x000081) < prev(byte(0x000081))) && 
              bit7(0x000081) == 1 && bit6(0x000081) == 1
)

achievement(
    title = "Minosar is Wrecked", points = 25,
    description = "Defeat The Stage 6 Boss without Dying",
    id = 73309, badge = "78621", published = "3/9/2019 9:59:07 AM", modified = "10/1/2019 1:58:01 PM",
    trigger = never(byte(0x000002) != 128) && never(byte(0x000052) != 5) && never(byte(0x0008F6) > 0) && byte(0x00007D)
               == 1 && once(byte(0x000081) == 50) && repeated(5, byte(0x000081) < prev(byte(0x000081))) && 
              bit7(0x000081) == 1 && bit6(0x000081) == 1
)

achievement(
    title = "The Last Haggah", points = 25,
    description = "Defeat The Stage 5 Boss without Dying",
    id = 73306, badge = "78620", published = "3/9/2019 9:58:24 AM", modified = "10/1/2019 1:58:01 PM",
    trigger = never(byte(0x000002) != 128) && never(byte(0x000052) != 4) && never(byte(0x0008F6) > 0) && byte(0x00007D)
               == 1 && once(byte(0x000081) == 50) && repeated(5, byte(0x000081) < prev(byte(0x000081))) && 
              bit7(0x000081) == 1 && bit6(0x000081) == 1
)

achievement(
    title = "Mashed Masher ", points = 25,
    description = "Defeat The Stage 4 Boss without Dying",
    id = 73303, badge = "78619", published = "3/9/2019 9:57:48 AM", modified = "10/1/2019 1:58:01 PM",
    trigger = never(byte(0x000002) != 128) && never(byte(0x000052) != 3) && never(byte(0x0008F6) > 0) && byte(0x00007D)
               == 1 && once(byte(0x000081) == 50) && repeated(5, byte(0x000081) < prev(byte(0x000081))) && 
              bit7(0x000081) == 1 && bit6(0x000081) == 1
)


achievement(
    title = "Fit to Print but Not Tacapy", points = 25,
    description = "Defeat The Stage 3 Boss without Dying",
    id = 73300, badge = "78618", published = "3/9/2019 9:57:07 AM", modified = "10/1/2019 1:58:01 PM",
    trigger = never(byte(0x000002) != 128) && never(byte(0x000052) != 2) && never(byte(0x0008F6) > 0) && byte(0x00007D)
               == 1 && once(byte(0x000081) == 40) && repeated(5, byte(0x000081) < prev(byte(0x000081))) && 
              bit7(0x000081) == 1 && bit6(0x000081) == 1
)

achievement(
    title = "Aarghin' Through", points = 25,
    description = "Defeat The Stage 2 Boss without Dying",
    id = 73297, badge = "78617", published = "3/9/2019 9:56:39 AM", modified = "10/1/2019 1:58:01 PM",
    trigger = never(byte(0x000002) != 128) && never(byte(0x000052) != 1) && never(byte(0x0008F6) > 0) && byte(0x00007D)
               == 1 && once(byte(0x000081) == 40) && repeated(5, byte(0x000081) < prev(byte(0x000081))) && 
              bit7(0x000081) == 1 && bit6(0x000081) == 1
)

achievement(
    title = "In Space no one can hear a Squime", points = 25,
    description = "Defeat The Stage 1 Boss without Dying",
    id = 73294, badge = "78616", published = "3/9/2019 9:56:07 AM", modified = "10/1/2019 1:58:01 PM",
    trigger = never(byte(0x000002) != 128) && never(byte(0x000052) != 0) && never(byte(0x0008F6) > 0) && byte(0x00007D)
               == 1 && once(byte(0x000081) == 30) && repeated(5, byte(0x000081) < prev(byte(0x000081))) && 
              bit7(0x000081) == 1 && bit6(0x000081) == 1
)

//Item Collection

achievement(
    title = "Calliope Collector", points = 10,
    description = "Get All 17 Items in Calliope",
    id = 73292, badge = "78613", published = "3/9/2019 9:55:47 AM", modified = "10/1/2019 1:58:01 PM",
    trigger = byte(0x000084) == 1 && byte(0x000085) == 1 && byte(0x000086) == 1 && byte(0x000087) == 1 && byte(0x000088)
               == 1 && byte(0x000089) == 1 && byte(0x00008B) == 1 && byte(0x00008C) == 1 && byte(0x00008D) == 1 && 
              byte(0x00008E) == 1 && byte(0x00008F) == 1 && byte(0x000090) == 1 && byte(0x000091) == 1 && byte(0x000092)
               == 1 && byte(0x000093) == 1 && byte(0x000094) == 1 && byte(0x000095) == 1 && byte(0x000A5F) == 17 && 
              once(byte(0x000A5F) > prev(byte(0x000A5F))) && never(byte(0x000002) != 128) && never(byte(0x000052) != 0)
)

achievement(
    title = "Thalia Collector", points = 10,
    description = "Get All 14 Items in Thalia",
    id = 73307, badge = "78613", published = "3/9/2019 9:58:31 AM", modified = "10/1/2019 1:58:01 PM",
    trigger = byte(0x000084) == 1 && byte(0x000085) == 1 && byte(0x000086) == 1 && byte(0x000087) == 1 && byte(0x000088)
               == 1 && byte(0x000089) == 1 && byte(0x00008A) == 1 && byte(0x00008B) == 1 && byte(0x00008C) == 1 && 
              byte(0x00008D) == 1 && byte(0x00008E) == 1 && byte(0x00008F) == 1 && byte(0x000090) == 1 && byte(0x000091)
               == 1 && byte(0x000A5F) == 14 && once(byte(0x000A5F) > prev(byte(0x000A5F))) && never(byte(0x000002) !=
               128) && never(byte(0x000052) != 5)
)

achievement(
    title = "Melpomene Collector", points = 10,
    description = "Get All 13 Items in Melpomene",
    id = 73304, badge = "78613", published = "3/9/2019 9:57:54 AM", modified = "10/1/2019 1:58:01 PM",
    trigger = byte(0x000084) == 1 && byte(0x000085) == 1 && byte(0x000086) == 1 && byte(0x000087) == 1 && byte(0x000088)
               == 1 && byte(0x000089) == 1 && byte(0x00008A) == 1 && byte(0x00008B) == 1 && byte(0x00008C) == 1 && 
              byte(0x00008D) == 1 && byte(0x00008E) == 1 && byte(0x00008F) == 1 && byte(0x000090) == 1 && byte(0x000A5F)
               == 13 && once(byte(0x000A5F) > prev(byte(0x000A5F))) && never(byte(0x000002) != 128) && 
              never(byte(0x000052) != 4)
)

achievement(
    title = "Euterpe Collector", points = 10,
    description = "Get All 12 Items in Euterpe",
    id = 73301, badge = "78613", published = "3/9/2019 9:57:13 AM", modified = "10/1/2019 1:58:01 PM",
    trigger = byte(0x000084) == 1 && byte(0x000085) == 1 && byte(0x000086) == 1 && byte(0x000087) == 1 && byte(0x000088)
               == 1 && byte(0x000089) == 1 && byte(0x00008A) == 1 && byte(0x00008B) == 1 && byte(0x00008C) == 1 && 
              byte(0x00008D) == 1 && byte(0x00008E) == 1 && byte(0x00008F) == 1 && byte(0x000A5F) == 12 && 
              once(byte(0x000A5F) > prev(byte(0x000A5F))) && never(byte(0x000002) != 128) && never(byte(0x000052) != 3)
)

achievement(
    title = "Erato Collector", points = 10,
    description = "Get All 15 Items in Erato",
    id = 73298, badge = "78613", published = "3/9/2019 9:56:46 AM", modified = "10/1/2019 1:58:01 PM",
    trigger = byte(0x000084) == 1 && byte(0x000085) == 1 && byte(0x000086) == 1 && byte(0x000087) == 1 && byte(0x000088)
               == 1 && byte(0x000089) == 1 && byte(0x00008A) == 1 && byte(0x00008B) == 1 && byte(0x00008C) == 1 && 
              byte(0x00008D) == 1 && byte(0x00008E) == 1 && byte(0x00008F) == 1 && byte(0x000090) == 1 && byte(0x000091)
               == 1 && byte(0x000092) == 1 && byte(0x000A5F) == 15 && once(byte(0x000A5F) > prev(byte(0x000A5F))) && 
              never(byte(0x000002) != 128) && never(byte(0x000052) != 2)
)

achievement(
    title = "Clio Collector", points = 10,
    description = "Get All 13 Items in Clio",
    id = 73295, badge = "78613", published = "3/9/2019 9:56:14 AM", modified = "10/1/2019 1:58:01 PM",
    trigger = byte(0x000084) == 1 && byte(0x000085) == 1 && byte(0x000086) == 1 && byte(0x000087) == 1 && byte(0x000088)
               == 1 && byte(0x000089) == 1 && byte(0x00008A) == 1 && byte(0x00008B) == 1 && byte(0x00008C) == 1 && 
              byte(0x00008D) == 1 && byte(0x00008E) == 1 && byte(0x00008F) == 1 && byte(0x000090) == 1 && byte(0x000A5F)
               == 13 && once(byte(0x000A5F) > prev(byte(0x000A5F))) && never(byte(0x000002) != 128) && 
              never(byte(0x000052) != 1)
)

//Hostage Collection

achievement(
    title = "Melpomene Hostage Rescuer", points = 10,
    description = "Save all 12 Hostages in Melpomene",
    id = 73305, badge = "78614", published = "3/9/2019 9:58:13 AM", modified = "10/1/2019 1:58:01 PM",
    trigger = low4(0x00005E) != 0 && high4(0x00005E) != 0 && byte(0x000062) != 0 && low4(0x000064) != 0 && 
              high4(0x000064) != 0 && byte(0x000068) != 0 && byte(0x000069) != 0 && low4(0x00006A) != 0 && 
              high4(0x00006A) != 0 && byte(0x00006D) != 0 && byte(0x000071) != 0 && byte(0x000072) != 0 && 
              never(byte(0x000002) != 128) && never(byte(0x000052) != 4)
)

achievement(
    title = "Euterpe Hostage Rescuer", points = 10,
    description = "Save all 12 Hostages in Euterpe",
    id = 73302, badge = "78614", published = "3/9/2019 9:57:25 AM", modified = "10/1/2019 1:58:01 PM",
    trigger = byte(0x00005D) != 0 && byte(0x000060) != 0 && byte(0x000062) != 0 && byte(0x000063) != 0 && byte(0x000064)
               != 0 && byte(0x000065) != 0 && byte(0x000067) != 0 && byte(0x000068) != 0 && byte(0x000068) != 0 && 
              byte(0x00006A) != 0 && byte(0x00006C) != 0 && byte(0x00006F) != 0 && never(byte(0x000002) != 128) && 
              never(byte(0x000052) != 3)
)

achievement(
    title = "Erato Hostage Rescuer", points = 10,
    description = "Save all 12 Hostages in Erato",
    id = 73299, badge = "78614", published = "3/9/2019 9:56:53 AM", modified = "10/1/2019 1:58:01 PM",
    trigger = byte(0x00005C) != 0 && byte(0x00005D) != 0 && byte(0x00005F) != 0 && byte(0x000060) != 0 && byte(0x000061)
               != 0 && byte(0x000063) != 0 && byte(0x000065) != 0 && byte(0x000067) != 0 && low4(0x00006B) != 0 && 
              high4(0x00006B) != 0 && low4(0x00006E) != 0 && high4(0x00006E) != 0 && never(byte(0x000002) != 128) && 
              never(byte(0x000052) != 2)
)

achievement(
    title = "Clio Hostage Rescuer", points = 10,
    description = "Save all 12 Hostages in Clio",
    id = 73296, badge = "78614", published = "3/9/2019 9:56:21 AM", modified = "10/1/2019 1:58:01 PM",
    trigger = byte(0x00005C) != 0 && byte(0x00005D) != 0 && byte(0x00005E) != 0 && byte(0x00005F) != 0 && byte(0x000060)
               != 0 && byte(0x000063) != 0 && byte(0x000065) != 0 && byte(0x000066) != 0 && byte(0x000067) != 0 && 
              low4(0x000068) != 0 && high4(0x000068) != 0 && byte(0x00006A) != 0 && never(byte(0x000002) != 128) && 
              never(byte(0x000052) != 1)
)

achievement(
    title = "Calliope Hostage Rescuer", points = 10,
    description = "Save all 12 Hostages in Calliope",
    id = 73293, badge = "78614", published = "3/9/2019 9:55:57 AM", modified = "3/12/2019 5:25:48 PM",
    trigger = byte(0x00005C) != 0 && byte(0x00005E) != 0 && byte(0x00005F) != 0 && byte(0x000060) != 0 && byte(0x000061)
               != 0 && byte(0x000063) != 0 && byte(0x000064) != 0 && byte(0x000066) != 0 && byte(0x000069) != 0 && 
              byte(0x00006B) != 0 && byte(0x00006C) != 0 && byte(0x00006F) != 0 && never(byte(0x000002) != 128) && 
              never(byte(0x000052) != 0)
)

achievement(
    title = "Thalia Hostage Rescuer", points = 10,
    description = "Save all 12 Hostages in Thalia",
    id = 73308, badge = "78614", published = "3/9/2019 9:55:57 AM", modified = "3/12/2019 5:25:48 PM",
    trigger = byte(0x00005C) != 0 && byte(0x00005E) != 0 && byte(0x00005F) != 0 && byte(0x000060) != 0 && byte(0x000061)
               != 0 && byte(0x000063) != 0 && byte(0x000064) != 0 && byte(0x000066) != 0 && byte(0x000069) != 0 && 
              byte(0x00006B) != 0 && byte(0x00006C) != 0 && byte(0x00006F) != 0 && never(byte(0x000002) != 128) && 
              never(byte(0x000052) != 0)
)