-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2024 at 01:06 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `40289157`
--

-- --------------------------------------------------------

--
-- Table structure for table `card`
--

CREATE TABLE `card` (
  `card_id` int(11) NOT NULL,
  `card_name` varchar(255) NOT NULL,
  `url_img` varchar(255) NOT NULL,
  `user_collection_id` int(11) NOT NULL,
  `illustrator` varchar(255) NOT NULL,
  `rarity_id` int(11) NOT NULL,
  `expansion_id` int(11) NOT NULL,
  `hp` int(11) NOT NULL,
  `card_type_id` int(11) NOT NULL,
  `attack_id` int(11) NOT NULL,
  `weakness_id` int(11) DEFAULT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `card`
--

INSERT INTO `card` (`card_id`, `card_name`, `url_img`, `user_collection_id`, `illustrator`, `rarity_id`, `expansion_id`, `hp`, `card_type_id`, `attack_id`, `weakness_id`, `description`) VALUES
(1, 'Blastoise', 'https://www.tcgdex.net/_next/image?url=https%3A%2F%2Fassets.tcgdex.net%2Fen%2Fbase%2Fbase1%2F2%2Fhigh.webp&w=750&q=100', 1, 'Ken Sugimori', 2, 1, 100, 1, 1, 1, 'A brutal Pokémon with pressurized water jets on its shell. They are used for high-speed tackles.'),
(2, 'Charizard', 'https://www.tcgdex.net/_next/image?url=https%3A%2F%2Fassets.tcgdex.net%2Fen%2Fbase%2Fbase1%2F4%2Fhigh.webp&w=384&q=100', 2, 'Mitsuhiro Arita', 2, 1, 120, 2, 2, 2, 'Spits fire that is hot enough to melt boulders. Known to unintentionally cause forest fires.'),
(3, 'Gyarados', 'https://www.tcgdex.net/_next/image?url=https%3A%2F%2Fassets.tcgdex.net%2Fen%2Fbase%2Fbase1%2F6%2Fhigh.webp&w=750&q=100', 3, 'Mitsuhiro Arita', 2, 1, 100, 1, 3, 3, 'Rarely seen in the wild. Huge and vicious, it is capable of destroying entire cities in a rage.'),
(4, 'Magneton', 'https://www.tcgdex.net/_next/image?url=https%3A%2F%2Fassets.tcgdex.net%2Fen%2Fbase%2Fbase1%2F9%2Fhigh.webp&w=750&q=100', 1, 'Keiji Kinebuchi', 2, 1, 60, 10, 4, 4, 'Formed by several Magnemites linked together. It frequently appears when sunspots flare up.'),
(5, 'Ninetales', 'https://www.tcgdex.net/_next/image?url=https%3A%2F%2Fassets.tcgdex.net%2Fen%2Fbase%2Fbase1%2F12%2Fhigh.webp&w=750&q=100', 1, 'Ken Sugimori', 2, 1, 80, 2, 5, 2, 'Very smart and very vengeful. Grabbing one of its many tails could result in a 1,000-year curse.'),
(6, 'Venusaur', 'https://www.tcgdex.net/_next/image?url=https%3A%2F%2Fassets.tcgdex.net%2Fen%2Fbase%2Fbase1%2F15%2Fhigh.webp&w=750&q=100', 2, 'Mitsuhiro Arita', 2, 1, 100, 3, 6, 5, 'This plant blooms when it is absorbing solar energy. It stays on the move to seek sunlight.'),
(8, 'Dragonair', 'https://www.tcgdex.net/_next/image?url=https%3A%2F%2Fassets.tcgdex.net%2Fen%2Fbase%2Fbase1%2F18%2Fhigh.webp&w=750&q=100', 3, 'Mitsuhiro Arita', 2, 1, 80, 5, 7, NULL, 'A mystical Pokémon that exudes a gentle aura. Has the ability to change climate conditions.'),
(9, 'Electabuzz', 'https://www.tcgdex.net/_next/image?url=https%3A%2F%2Fassets.tcgdex.net%2Fen%2Fbase%2Fbase1%2F20%2Fhigh.webp&w=750&q=100', 1, 'Ken Sugimori', 2, 1, 70, 10, 8, 4, 'Normally found near power plants, it can wander away and cause major blackouts in cities.'),
(10, 'Arcanine', 'https://www.tcgdex.net/_next/image?url=https%3A%2F%2Fassets.tcgdex.net%2Fen%2Fbase%2Fbase1%2F23%2Fhigh.webp&w=750&q=100', 2, 'Ken Sugimori', 4, 1, 100, 2, 9, 2, 'A Pokémon that has been long admired for its beauty. It runs gracefully, as if on wings.'),
(11, 'Dewgong', 'https://www.tcgdex.net/_next/image?url=https%3A%2F%2Fassets.tcgdex.net%2Fen%2Fbase%2Fbase1%2F25%2Fhigh.webp&w=750&q=100', 1, 'Mitsuhiro Arita', 4, 1, 80, 1, 10, 1, 'Stores thermal energy in its body. Swims at a steady 8 knots even in intensely cold waters.'),
(12, 'Growlithe', 'https://www.tcgdex.net/_next/image?url=https%3A%2F%2Fassets.tcgdex.net%2Fen%2Fbase%2Fbase1%2F28%2Fhigh.webp&w=750&q=100', 2, 'Ken Sugimori', 4, 1, 60, 2, 11, 2, 'Very protective of its territory. It will bark and bite to repel intruders from its space.'),
(13, 'Pikachu', 'https://www.tcgdex.net/_next/image?url=https%3A%2F%2Fassets.tcgdex.net%2Fen%2Fbase%2Fbase1%2F58%2Fhigh.webp&w=750&q=100', 3, 'Mitsuhiro Arita', 3, 1, 40, 6, 12, 4, 'When several of these Pokémon gather, their electricity can cause lightning storms.'),
(14, 'Lapras', 'https://www.tcgdex.net/_next/image?url=https%3A%2F%2Fassets.tcgdex.net%2Fen%2Fbase%2Fbase3%2F10%2Fhigh.webp&w=2048&q=100', 1, 'Ken Sugimori', 1, 3, 80, 1, 13, 1, 'A Pokémon that has been overhunted almost to extinction. It can ferry people across water.\r\n'),
(15, 'Moltres', 'https://www.tcgdex.net/_next/image?url=https%3A%2F%2Fassets.tcgdex.net%2Fen%2Fbase%2Fbase3%2F12%2Fhigh.webp&w=750&q=100', 2, 'Mitsuhiro Arita', 1, 3, 70, 2, 14, 6, 'Known as the legendary bird of fire. Every flap of its wings creates a dazzling flash of flames.'),
(16, 'Zapdos', 'https://www.tcgdex.net/_next/image?url=https%3A%2F%2Fassets.tcgdex.net%2Fen%2Fbase%2Fbase3%2F15%2Fhigh.webp&w=2048&q=100', 3, 'Mitsuhiro Arita', 1, 3, 80, 10, 15, 6, 'A legendary thunderbird Pokémon whose anger is said to cause storms. Some say it has lived above the clouds for thousands of years.'),
(17, 'Gengar', 'https://www.tcgdex.net/_next/image?url=https%3A%2F%2Fassets.tcgdex.net%2Fen%2Fbase%2Fbase3%2F20%2Fhigh.webp&w=750&q=100', 1, 'Keiji Kinebuchi', 2, 3, 80, 4, 16, 6, 'Under a full moon, this Pokémon likes to mimic the shadows of people and laugh at their fright.'),
(18, 'Hypno', 'https://www.tcgdex.net/_next/image?url=https%3A%2F%2Fassets.tcgdex.net%2Fen%2Fbase%2Fbase3%2F23%2Fhigh.webp&w=2048&q=100', 2, 'Ken Sugimori', 2, 3, 90, 4, 16, 7, 'When it locks eyes with an enemy, it will use a mix of psi moves such as Hypnosis and Confusion.'),
(19, 'Raichu', 'https://www.tcgdex.net/_next/image?url=https%3A%2F%2Fassets.tcgdex.net%2Fen%2Fbase%2Fbase3%2F29%2Fhigh.webp&w=2048&q=100', 3, 'Mitsuhiro Arita', 2, 3, 90, 10, 17, 4, 'Its long tail serves as a ground to protect itself from its own high voltage power.'),
(20, 'Arbok', 'https://www.tcgdex.net/_next/image?url=https%3A%2F%2Fassets.tcgdex.net%2Fen%2Fbase%2Fbase3%2F31%2Fhigh.webp&w=2048&q=100', 1, 'Ken Sugimori', 4, 3, 60, 3, 18, 7, 'It is rumored that the ferocious warning markings on its belly differ from area to area.'),
(21, 'Omanyte', 'https://www.tcgdex.net/_next/image?url=https%3A%2F%2Fassets.tcgdex.net%2Fen%2Fbase%2Fbase3%2F52%2Fhigh.webp&w=2048&q=100', 1, 'Kagemaru Himeno', 3, 3, 40, 1, 13, 3, 'Although long extinct, in rare cases, it can be genetically resurrected from fossils.'),
(22, 'Flareon', 'https://www.tcgdex.net/_next/image?url=https%3A%2F%2Fassets.tcgdex.net%2Fen%2Fbase%2Fbase2%2F3%2Fhigh.webp&w=2048&q=100', 3, 'Kagemaru Himeno', 1, 2, 70, 2, 19, 2, 'When storing thermal energy in its body, its temperature could soar to over 1600 degrees.'),
(23, 'Mr. Mime', 'https://www.tcgdex.net/_next/image?url=https%3A%2F%2Fassets.tcgdex.net%2Fen%2Fbase%2Fbase2%2F6%2Fhigh.webp&w=2048&q=100', 2, 'Ken Sugimori', 1, 2, 40, 4, 20, 7, 'If interrupted while miming, it will slap around the enemy with its broad hands.'),
(24, 'Pinsir', 'https://www.tcgdex.net/_next/image?url=https%3A%2F%2Fassets.tcgdex.net%2Fen%2Fbase%2Fbase2%2F9%2Fhigh.webp&w=2048&q=100', 1, 'Kagemaru Himeno', 1, 2, 60, 3, 21, 5, 'If it fails to crush the victim in its pincers, it will swing its victim around and toss it hard.'),
(25, 'Wigglytuff', 'https://www.tcgdex.net/_next/image?url=https%3A%2F%2Fassets.tcgdex.net%2Fen%2Fbase%2Fbase2%2F16%2Fhigh.webp&w=2048&q=100', 1, 'Mitsuhiro Arita', 1, 2, 80, 5, 23, 4, 'The body is soft and rubbery. When angered, it will suck in air and inflate itself to an enormous size.'),
(26, 'Jolteon', 'https://www.tcgdex.net/_next/image?url=https%3A%2F%2Fassets.tcgdex.net%2Fen%2Fbase%2Fbase2%2F20%2Fhigh.webp&w=2048&q=100', 3, 'Kagemaru Himeno', 2, 2, 70, 10, 19, 4, 'It accumulates negative ions from the atmosphere to blast out 10,000-volt lightning bolts.'),
(27, '', 'https://www.tcgdex.net/_next/image?url=https%3A%2F%2Fassets.tcgdex.net%2Fen%2Fbase%2Fbase2%2F24%2Fhigh.webp&w=2048&q=100', 1, 'Kagemaru Himeno', 2, 2, 80, 5, 24, 1, 'When hunting, it skins the surface of water at high speed to pick off unwary prey such as Magikarp.'),
(28, 'Venomoth', 'https://www.tcgdex.net/_next/image?url=https%3A%2F%2Fassets.tcgdex.net%2Fen%2Fbase%2Fbase2%2F29%2Fhigh.webp&w=2048&q=100', 2, 'Ken Sugimori', 2, 2, 70, 3, 25, 6, 'The dust-like scales covering its wings are color-coded to indicate the kinds of poison it has.'),
(29, 'Victreebel', 'https://www.tcgdex.net/_next/image?url=https%3A%2F%2Fassets.tcgdex.net%2Fen%2Fbase%2Fbase2%2F30%2Fhigh.webp&w=2048&q=100', 1, 'Ken Sugimori', 2, 2, 80, 3, 26, 5, 'Said to live in huge colonies deep in jungles, although no one has ever returned from there.'),
(30, 'Primeape', 'https://www.tcgdex.net/_next/image?url=https%3A%2F%2Fassets.tcgdex.net%2Fen%2Fbase%2Fbase2%2F43%2Fhigh.webp&w=2048&q=100', 2, 'Kagemaru Himeno', 4, 2, 70, 6, 27, 7, 'Always furious and tenacious to boot. It will not abandon chasing its quarry until its quarry is caught.'),
(31, 'Rhyhorn', 'https://www.tcgdex.net/_next/image?url=https%3A%2F%2Fassets.tcgdex.net%2Fen%2Fbase%2Fbase2%2F61%2Fhigh.webp&w=2048&q=100', 3, 'Mitsuhiro Arita', 3, 2, 70, 6, 29, 8, 'Its massive bones are 1,000 times harder than human bones. It can easily knock a trailer flying.'),
(32, 'Chansey', 'https://www.tcgdex.net/_next/image?url=https%3A%2F%2Fassets.tcgdex.net%2Fen%2Fbase%2Fbase4%2F3%2Fhigh.webp&w=2048&q=100', 1, 'Ken Sugimori', 1, 4, 120, 5, 30, 7, 'A rare and elusive Pokémon that is said to bring happiness to those who manage to catch it.'),
(33, 'Hitmonchan', 'https://www.tcgdex.net/_next/image?url=https%3A%2F%2Fassets.tcgdex.net%2Fen%2Fbase%2Fbase4%2F8%2Fhigh.webp&w=2048&q=100', 2, 'Ken Sugimori', 1, 4, 70, 6, 31, 7, 'The spirit of a pro boxer has infused this Pokémon. It throws punches that are faster than a bullet train.'),
(34, 'Nidoking', 'https://www.tcgdex.net/_next/image?url=https%3A%2F%2Fassets.tcgdex.net%2Fen%2Fbase%2Fbase4%2F11%2Fhigh.webp&w=2048&q=100', 3, 'Ken Sugimori', 1, 4, 90, 3, 32, 7, 'Uses its powerful tail in battle to smash, constrict, then break its prey\'s bones.'),
(35, 'Poliwrath', 'https://www.tcgdex.net/_next/image?url=https%3A%2F%2Fassets.tcgdex.net%2Fen%2Fbase%2Fbase4%2F15%2Fhigh.webp&w=2048&q=100', 1, 'Ken Sugimori', 1, 4, 90, 1, 33, 3, 'An adept swimmer at both the front crawl and breaststroke. Easily overtakes the best human swimmers.'),
(36, 'Beedrill', 'https://www.tcgdex.net/_next/image?url=https%3A%2F%2Fassets.tcgdex.net%2Fen%2Fbase%2Fbase4%2F21%2Fhigh.webp&w=2048&q=100', 1, 'Ken Sugimori', 2, 4, 80, 3, 34, 5, 'Flies at high speed and attacks using the large, venomous stingers on its forelegs and tail.'),
(37, 'Dugtrio', 'https://www.tcgdex.net/_next/image?url=https%3A%2F%2Fassets.tcgdex.net%2Fen%2Fbase%2Fbase4%2F23%2Fhigh.webp&w=2048&q=100', 1, 'Keiji Kinebuchi', 2, 4, 70, 6, 35, 3, 'A team of Diglett triplets. It triggers huge earthquakes by burrowing 60 miles underground.'),
(38, 'Kangaskhan', 'https://www.tcgdex.net/_next/image?url=https%3A%2F%2Fassets.tcgdex.net%2Fen%2Fbase%2Fbase4%2F26%2Fhigh.webp&w=2048&q=100', 3, 'Mitsuhiro Arita', 2, 4, 90, 5, 36, 4, 'The infant rarely ventures out of its mother\'s protective pouch until it is three years old.'),
(39, 'Seaking', 'https://www.tcgdex.net/_next/image?url=https%3A%2F%2Fassets.tcgdex.net%2Fen%2Fbase%2Fbase4%2F60%2Fhigh.webp&w=2048&q=100', 1, 'Kagemaru Himeno', 4, 4, 70, 1, 37, 1, 'In the autumn spawning season, they can be seen swimming powerfully up rivers and creeks.'),
(40, 'Caterpie', 'https://www.tcgdex.net/_next/image?url=https%3A%2F%2Fassets.tcgdex.net%2Fen%2Fbase%2Fbase4%2F68%2Fhigh.webp&w=2048&q=100', 1, 'Ken Sugimori', 3, 4, 40, 3, 38, 5, 'It is covered with a green skin. When it grows, it sheds the skin, covers itself with silk, and becomes a cocoon.'),
(41, 'Rattata', 'https://www.tcgdex.net/_next/image?url=https%3A%2F%2Fassets.tcgdex.net%2Fen%2Fbase%2Fbase4%2F89%2Fhigh.webp&w=2048&q=100', 1, 'Mitsuhiro Arita', 3, 4, 30, 5, 39, 4, 'Bites anything when it attacks. Small and very quick, it is a common sight in many places.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `card`
--
ALTER TABLE `card`
  ADD PRIMARY KEY (`card_id`),
  ADD KEY `rarity_id_to_rarity_id` (`rarity_id`),
  ADD KEY `expansion_id_to_expansion_id` (`expansion_id`),
  ADD KEY `attack_id_to_attack_id` (`attack_id`),
  ADD KEY `weakness_id_to_weakness_id` (`weakness_id`),
  ADD KEY `card_type_id_to_card_type_id` (`card_type_id`),
  ADD KEY `user_collection_id_to_user_collection_id` (`user_collection_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `card`
--
ALTER TABLE `card`
  MODIFY `card_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `card`
--
ALTER TABLE `card`
  ADD CONSTRAINT `attack_id_to_attack_id` FOREIGN KEY (`attack_id`) REFERENCES `attack` (`attack_id`),
  ADD CONSTRAINT `card_type_id_to_card_type_id` FOREIGN KEY (`card_type_id`) REFERENCES `card_type` (`card_type_id`),
  ADD CONSTRAINT `expansion_id_to_expansion_id` FOREIGN KEY (`expansion_id`) REFERENCES `expansions` (`expansion_id`),
  ADD CONSTRAINT `rarity_id_to_rarity_id` FOREIGN KEY (`rarity_id`) REFERENCES `rarity` (`rarity_id`),
  ADD CONSTRAINT `user_collection_id_to_user_collection_id` FOREIGN KEY (`user_collection_id`) REFERENCES `user_collection` (`user_collection_id`),
  ADD CONSTRAINT `weakness_id_to_weakness_id` FOREIGN KEY (`weakness_id`) REFERENCES `weakness` (`weakness_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
