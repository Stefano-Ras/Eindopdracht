-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 19 jun 2024 om 09:51
-- Serverversie: 10.4.27-MariaDB
-- PHP-versie: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `recipe`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `ingredientlist`
--

CREATE TABLE `ingredientlist` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Ingredients` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `ingredientlist`
--

INSERT INTO `ingredientlist` (`ID`, `Name`, `Ingredients`) VALUES
(1, 'Dakgangjeong', '- 1 pound boneless skinless chicken thigh and/or breast\r\n- 1/2 cup milk optional\r\n- 1/4 teaspoon salt\r\n- pinch pepper\r\n- 1/2 teaspoon minced garlic\r\n- 1/2 teaspoon minced ginger\r\n- 1 tablespoon rice wine if not using milk\r\n- ⅓ cup potato starch or corn starch\r\n- 1 tablespoon soy sauce\r\n- 3 tablespoons rice wine or mirin\r\n- 1 tablespoon gochujang\r\n- 3 tablespoons honey\r\n- 2 teaspoons sesame oil\r\n- 2 tablespoons brown sugar\r\n- 1 teaspoon minced garlic\r\n- 1 teaspoon grated ginger');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `ingredients`
--

CREATE TABLE `ingredients` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Unit` varchar(255) DEFAULT NULL,
  `Amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `ingredients`
--

INSERT INTO `ingredients` (`ID`, `Name`, `Unit`, `Amount`) VALUES
(0, 'Pepper', 'Pinch', 1),
(1, 'Rice', 'Grams', 100),
(2, 'Soy sauce', 'Tablespoon', 1),
(3, 'Garlic', 'Clove(s)', 1),
(4, 'Ginger', 'Tablespoon', 1),
(5, 'Onion', 'Clove', 1),
(6, 'Salt', 'Pinch', 1),
(7, 'Pepper', 'Pinch', 1),
(8, 'Chicken', 'Kilo', 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `recipe`
--

CREATE TABLE `recipe` (
  `ID` int(11) NOT NULL,
  `regionId` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Description` varchar(1000) DEFAULT NULL,
  `Instructions` varchar(1000) DEFAULT NULL,
  `Life_Story` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `recipe`
--

INSERT INTO `recipe` (`ID`, `regionId`, `Name`, `Description`, `Instructions`, `Life_Story`) VALUES
(0, 0, 'Jambalaya', 'Rice dish with spicy chorizo and peppers stewed in water with cajun spices', 'Sauté the chicken and sausage. Sauté until the chicken is cooked through and the sausage is lightly browned. Then transfer to a clean plate and set aside.\r\nSauté the veggies. Sauté the onion, bell pepper, celery, jalapeño and garlic until soft.\r\nAdd rice, liquids and seasonings. Add in the uncooked rice, chicken stock, crushed tomatoes, Cajun/Creole seasoning, thyme, cayenne and bay leaf. Give everything a good stir.\r\nCover and cook. Then cook for 25-30 minutes, being sure to stir the mixture every 5 minutes or so (to prevent burning) until the rice is nearly tender.\r\nAdd the okra and shrimp.  And cook for a final 5 minutes or so, until the shrimp is pink and opaque. Add the chicken and sausage back in.\r\nTaste and season. Season the jambalaya with salt and pepper (and extra Cajun/Creole seasoning, if needed) to taste.\r\nServe warm. Garnished with your desired toppings!\r\n', 'John and Cate were two of the very first neighbors I met when I moved to downtown Kansas City five years ago. When I arrived in the neighborhood, I didn’t know a soul around. But a cute new coffee shop serendipitously also happened to be opening next door that very week. And as I began to stop by morning after morning to order my favorite iced pour-over, I noticed that another couple was doing the same. Eventually we all introduced ourselves, and one of my favorite friendships was born.\r\n\r\nFor years, the three of us crossed paths at the coffee shop nearly every morning — giving each other groggy pre-caffeinated hugs, catching up on the past day’s events, ruffling the heads of one another’s pups, talkin’ shop about all things small business, and finally settling in at nearby tables with our laptops to work for a few hours. Then morning hangs eventually extended to evenings, swinging by one another’s places for impromptu happy hours and dinners, sneaking up to the rooftops to watch the f'),
(1, 1, 'Dakgangjeong', 'Crispy Korean fried chicken glazed in a sticky, sweet, and spicy sauce. This dakgangjeong recipe uses bite sized boneless chicken pieces, so it cooks up fast for a quick snack!\r\nLet’s make some Korean fried chicken! Dakgangjeong (닭강정) is a deep-fried crispy chicken dish glazed in a sticky, sweet, and spicy sauce. This recipe uses bite sized boneless chicken pieces, so it cooks up very fast in shallow oil. It’s the easiest Korean fried chicken you can make at home!', 'Dakgangjeong is traditionally made with a whole chicken cut up. Some people make it only with chicken wings. I usually use boneless, skinless chicken thighs for this recipe, but you can use breast meat if preferred.\r\n\r\nTo make this dish, I soak the chicken pieces in milk for a couple of hours, but it’s not absolutely necessary. This is a technique Koreans use to tenderize the meat and remove any gamey taste. The result is tender, juicy, and flavorful fried chicken.\r\n\r\nThen, marinate the chicken pieces with a little bit of salt, ginger and garlic before lightly coating them with the potato starch.The potato starch creates a light, crispy crust for the fried chicken.\r\n\r\nThe sauce is sweet and tangy with a little spicy kick from the gochujang (Korean red chili pepper paste). It’s far from fiery hot, but reduce or omit the gochujang if you’d like.', 'Whenever I go to Korea, I try to enjoy as much Korean fried chicken as possible. There are so many delicious variations! Dakgangjeong is a big part of the Korean fried chicken culture, and some of the best dakgangjeong places are in traditional markets and streets of Korea, sometimes with long lines.\r\n\r\nKoreans often enjoy fried chicken with beer, and that combination is called ChiMaek (치맥), chi from chicken (치킨) and maek from maekju (맥주, the Korean word for beer). Hope you make this chicken dish and enjoy your chimaek at home.\r\n\r\nYou can easily double or triple the recipe for a bigger crowd. Great for a potluck or a party. The chicken stays crispy!'),
(2, 3, 'Homemade mozerella', 'Hello curd nerds!\r\n\r\nI have personally tasted many a Fresh Mozzarella, especially true Mozzarella di Bufala with its salt brine flavor and distinctive taste it is indeed the true Mozzarella cheese. Cows milk Fresh Mozzarella has a slightly sweeter taste and soft texture, but when I made my own Fresh Mozzarella I was excited and proud! After all, I was now able to boast that the cheese my family and friends were enjoying was made by me! (it\'s a Chef thing) This by far is one of the most rewarding culinary tasks that you may do akin to bread baking!', 'Mike states that he must have gone through 50-60 gallons of milk to refine this procedure! Follow the instructions carefully and you should end up with an almost 100% foolproof batch of Mozzarella Cheese. Plan on it taking about an hour and a half to 2 hours. As you make more batches you can cut it down to maybe an hour or so. Use only whole milk. If you have access to farm fresh milk non pasteurized milk , even better. You may also use goat or buffalo milk.', 'I remember opening a large walk in refrigerator door, I could barely reach the handle.  The door was made of wood and cork. The inside of the refrigerator smelled sweet, of citrus and yeast doughs waiting for the next days creations.  In this dimly lit refrigerator there was a wooden barrel which my father told me not to go into. I moved over the lid and there they were these white round mounds of what I now know as fresh Mozzarella Cheese , Dad called it, \"Scamotz\" they were floating in this milky salty liquid. I reached into the cold whey and grabbed one!  I\'ve seen this practiced before by my father and like him, I took a bite into the chilled salty and creamy ball of Mozzarella Cheese.  The brine running down my cheek, wiping it quickly with my sleeve.');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `region`
--

CREATE TABLE `region` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `region`
--

INSERT INTO `region` (`ID`, `Name`, `Description`) VALUES
(0, 'American', 'American cuisine is generally a type of fusion cuisine which assimilates flavors from the melting pot of traditional American cooking techniques mixed with foreign and sometimes molecular gastronomy components.'),
(1, 'Asian', 'Asian cuisine is local, authentic, and traditional. It is rich in flavor and taste from the herbs and spices used in the preparations. Asian cuisine features multicultural dishes from diverse cultures and origins.\r\n       '),
(2, 'Dutch', 'Dutch food fucking sucks.'),
(3, 'European', 'The European cuisine includes a wide use of meat ranging from poultry to cattle, sheep, pork and varied game. There are an infinite number of dairy products such as yogurt, soft and hard cheeses.');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `ingredientlist`
--
ALTER TABLE `ingredientlist`
  ADD PRIMARY KEY (`ID`);

--
-- Indexen voor tabel `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`ID`);

--
-- Indexen voor tabel `recipe`
--
ALTER TABLE `recipe`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`),
  ADD KEY `regionId` (`regionId`);

--
-- Indexen voor tabel `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `region`
--
ALTER TABLE `region`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `recipe`
--
ALTER TABLE `recipe`
  ADD CONSTRAINT `recipe_ibfk_2` FOREIGN KEY (`regionId`) REFERENCES `region` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
