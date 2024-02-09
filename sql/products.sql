-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: db.3wa.io
-- Generation Time: Feb 09, 2024 at 06:41 AM
-- Server version: 5.7.33-0ubuntu0.18.04.1-log
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `maridoucet_bre01_eshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(2047) NOT NULL,
  `price` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `image_id`, `category_id`) VALUES
(1, 'Handmade dreamcatcher', 'Capture the essence of dreams with this exquisite handmade dreamcatcher. Meticulously crafted from supple leather, adorned with delicate feathers, and accented by wooden red pearls, each element is carefully chosen to evoke a sense of mystique and beauty. Hang it above your bed to ward off bad dreams and let only the good ones pass through its intricate web. With its rustic charm and artisanal appeal, this dreamcatcher is not just a decoration but a symbol of tranquility and serenity in any space. Bring a touch of Native American tradition and craftsmanship into your home with this unique piece that promises to inspire sweet dreams and peaceful nights.', 12, 1, 4),
(2, 'Vintage car', 'Step back in time with this iconic vintage 1950\'s Black American car. With its sleek lines, chrome accents, and timeless design, this automobile epitomizes the golden era of American automotive craftsmanship. From its powerful V8 engine to its luxurious interior featuring plush leather seats and classic dashboard details, every element of this car exudes elegance and sophistication. Whether you\'re cruising down the open road or turning heads at a car show, this meticulously restored beauty commands attention and admiration. Own a piece of history and experience the thrill of driving a true classic that captures the essence of 1950\'s Americana in every rev of its engine.', 5800, 2, 1),
(3, 'Tricycle', 'Introducing the perfect first ride for your little one - a vibrant red child tricycle that promises endless fun and excitement! With its sturdy steel frame and durable construction, this tricycle is designed for safety and stability while providing hours of joyous playtime. The bright red color adds a pop of fun and energy, making it irresistible to young adventurers. Equipped with comfortable handle grips, a padded seat, and easy-to-reach pedals, it\'s tailored for little hands and feet to navigate with ease. Whether they\'re cruising around the backyard or embarking on imaginary adventures, this tricycle encourages active play and fosters independence. Give your child the gift of exploration and laughter with this charming red tricycle that\'s sure to become a cherished childhood memory.', 24, 3, 1),
(4, 'Vintage clock', 'Add a touch of timeless elegance to your home with this vintage clock reminiscent of a bygone era. Featuring a classic design with Roman numerals for the 12, 3, 6, and 9, and elegant dots marking the other hours, this clock exudes sophistication and charm. Crafted with meticulous attention to detail, it boasts a sturdy metal frame and a glass-covered face that protects its intricate mechanism. The antique finish lends an air of nostalgia, while the precise quartz movement ensures accurate timekeeping. Whether placed on a mantel, shelf, or desk, this vintage clock is sure to become a focal point in any room, evoking a sense of tradition and refinement. Embrace the allure of yesteryears and elevate your décor with this exquisite timepiece that transcends trends and stands the test of time.', 18, 4, 2),
(5, 'Blue VW van', 'Embark on a journey down memory lane with this iconic blue VW van from the 1970s. A symbol of freedom, adventure, and counterculture, this beloved classic has captured hearts around the world. With its unmistakable silhouette, round headlights, and charming blue exterior, it\'s a timeless testament to Volkswagen\'s legacy. Step inside to discover a spacious and versatile interior, perfect for road trips, camping adventures, or simply cruising with friends. The retro-cool vibe is accentuated by vintage details like the iconic VW emblem, colorful curtains, and cozy seating. Powered by a reliable engine, this van promises a smooth ride and unforgettable memories wherever the road may lead. Whether you\'re a nostalgic enthusiast or a new generation of explorers, this blue VW van invites you to embrace the spirit of the \'70s and create your own unforgettable experiences on the open road.', 2850, 5, 1),
(6, 'Brown Highland cow', 'Meet the majestic beauty of the Scottish Highlands embodied in this stunning brown Highland cow. With its iconic shaggy coat, impressive curved horns, and soulful eyes, this gentle giant commands attention and admiration wherever it roams. Grazing peacefully amidst rolling hills and misty moorlands, the Highland cow epitomizes resilience and tranquility in its natural habitat. Its warm brown fur, thick and insulating against the chill of the Highlands, adds to its rugged charm and allure. A symbol of Scotland\'s rich cultural heritage and pastoral landscapes, this magnificent creature invites you to connect with nature and experience the timeless beauty of the Highlands. Whether encountered on a scenic countryside drive or depicted in a picturesque landscape painting, the brown Highland cow captivates hearts with its undeniable presence and unwavering grace.', 890, 6, 3),
(7, 'Glass teapot', 'Elevate your tea experience with this exquisite glass teapot, a fusion of elegance and functionality. Crafted from high-quality borosilicate glass, it offers clarity and durability, allowing you to appreciate the vibrant colors of your favorite teas as they steep. The sleek, modern design features a heat-resistant handle and a snug-fitting lid, ensuring effortless pouring and maximum flavor retention. Whether you\'re brewing delicate green teas, aromatic herbal blends, or bold black varieties, this teapot provides the perfect vessel for indulging in your favorite brews. Its transparent beauty adds a touch of sophistication to any table setting, while its practical design makes it a versatile companion for both casual gatherings and formal occasions. Treat yourself to the pleasure of savoring tea in style with this elegant glass teapot that combines form and function in perfect harmony.', 11, 7, 4),
(8, 'Vintage camera', 'Capture the essence of bygone eras with this vintage Ikon camera featuring a renowned Zeiss lens. A testament to timeless craftsmanship and precision engineering, this camera exudes nostalgic charm and artistic allure. Crafted with care and attention to detail, its classic design evokes a sense of nostalgia for the golden age of photography. Paired with a legendary Zeiss lens renowned for its unparalleled optical quality, this camera promises to elevate your photography to new heights. Whether you\'re a seasoned professional or an aspiring enthusiast, the vintage Ikon camera with its Zeiss lens offers a journey back in time while delivering exceptional image clarity and depth. Embrace the spirit of vintage photography and capture moments that transcend time with this iconic camera and lens combination.', 89, 8, 2),
(9, 'Fresh farm produce', 'Indulge in the vibrant flavors of farm-fresh produce with our exquisite selection, featuring peppery berries and crisp red onions. Sourced directly from local farms, these ingredients are bursting with freshness and vitality, delivering an explosion of taste and texture to your culinary creations. The pepper berries, with their bold and zesty flavor profile, add a delightful kick to any dish, while the red onions, with their crisp texture and sweet, tangy flavor, provide the perfect balance. Whether tossed in a refreshing salad, sautéed to perfection, or used as a flavorful garnish, our farm-fresh pepper berries and red onions elevate your dishes to new heights of deliciousness. Savor the taste of nature\'s bounty and experience the difference that fresh, quality ingredients make in every bite.', 8, 9, 3),
(10, 'Dark Honey', 'Indulge your senses in the rich, velvety sweetness of our dark honey, a true delight for discerning palates. Carefully harvested from the depths of lush forests and wildflower meadows, this premium honey boasts a deep, amber hue and a robust flavor profile that sets it apart. With notes of molasses, caramel, and a hint of floral undertones, each spoonful offers a decadent experience that lingers on the palate. Whether drizzled over warm biscuits, stirred into morning oats, or enjoyed straight from the jar, our dark honey adds a touch of luxury to any culinary creation. Packed with antioxidants and natural goodness, it not only tantalizes the taste buds but also nourishes the body and soul. Treat yourself to the unparalleled richness of our dark honey and elevate every culinary masterpiece to new heights of sweetness and sophistication.\r\n\r\n\r\n\r\n\r\n', 7, 10, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `image_id` (`image_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
