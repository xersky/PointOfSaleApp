-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 13, 2021 at 03:55 PM
-- Server version: 8.0.18
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rebaja_centro`
--

-- --------------------------------------------------------

--
-- Table structure for table `cmd`
--

DROP TABLE IF EXISTS `cmd`;
CREATE TABLE IF NOT EXISTS `cmd` (
  `ID` int(32) NOT NULL AUTO_INCREMENT,
  `QUANTITE` int(6) NOT NULL,
  `PRIX_TOTAL` decimal(8,2) NOT NULL,
  `ID_PRODUIT` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ID_TRANSACTION` int(32) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_PRODUIT` (`ID_PRODUIT`),
  KEY `ID_TRANSACTION` (`ID_TRANSACTION`)
) ENGINE=InnoDB AUTO_INCREMENT=475 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cmd`
--

INSERT INTO `cmd` (`ID`, `QUANTITE`, `PRIX_TOTAL`, `ID_PRODUIT`, `ID_TRANSACTION`) VALUES
(467, 1, '23.00', '3574661384870', 2),
(468, 1, '23.00', '3574661384870', 2),
(469, 1, '23.00', '3574661384870', 2),
(470, 1, '23.00', '3574661384870', 2),
(471, 1, '23.00', '3574661384870', 2),
(472, 3, '360.00', '1232420030100', 3),
(473, 1, '25.00', '4005808134830', 4),
(474, 2, '50.00', '4005808134830', 4);

-- --------------------------------------------------------

--
-- Table structure for table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `ID` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PRIX_UNITE` decimal(6,2) NOT NULL,
  `PRIX_STOCK` decimal(8,2) DEFAULT NULL,
  `NBR_UNITE` int(12) DEFAULT NULL,
  `ID_SCATEGORIE` int(6) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`),
  KEY `ID_SCATEGORIE` (`ID_SCATEGORIE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `produit`
--

INSERT INTO `produit` (`ID`, `DESCRIPTION`, `PRIX_UNITE`, `PRIX_STOCK`, `NBR_UNITE`, `ID_SCATEGORIE`) VALUES
('0902504V8', 'AL-Jazeerah Coffee mugs 3 pcs', '15.00', NULL, NULL, 5),
('1070950374604', '6 TUMBLER SET', '42.50', NULL, NULL, 5),
('1070950471334', 'Freshbowl microwave safe', '13.00', NULL, NULL, 5),
('1070950471341', 'Freshbowl microwave safe round', '13.00', NULL, NULL, 5),
('1113013110958777', 'Maroc Factory Porte-oeufs 12 PCS', '8.00', NULL, NULL, 5),
('1232420030100', 'SOLECASA Porcelain tagine set 4pcs', '120.00', NULL, NULL, 5),
('1601001812259', '4 SCOOPS MEASURING SPOONS', '14.00', NULL, NULL, 5),
('1700205000001', 'CELEBRITY TUMBLERS 6 PCS', '25.00', NULL, NULL, 5),
('2001599013414', 'SULTAN BARBECUE LUXE BBQ', '100.00', NULL, NULL, 5),
('2013000020099', 'Lqccor original ELECTRILL GRILL', '190.00', NULL, NULL, 5),
('210630200002', 'Fqbulous 6PCS. Drink Set', '40.00', NULL, NULL, 5),
('3059940003609', 'CILLIT BANG HIGIENE  750ml', '30.00', NULL, NULL, 2),
('3550190401714', 'DURALEX ovenchef plat à four oval 3.1L', '70.00', NULL, NULL, 5),
('3574661384870', 'Johnson\'s SOFT&Energise ducha 750ml', '23.00', NULL, NULL, 4),
('3574661520469', 'Johnson\'s baby champoo 500ml', '20.00', NULL, NULL, 4),
('4005808134830', 'NIVEA CREME SOFT GEL DE DUCHA 750ml', '25.00', NULL, NULL, 4),
('4005808917204', 'NIVEA CREME CARE GEL DE DUCHA 750ml', '25.00', NULL, NULL, 4),
('4008000002143', 'PREMIER INOX PRO BBQ GRILLE', '15.00', NULL, NULL, 5),
('4008000002563', 'PREMIER INOX 12 Brochettes', '20.00', NULL, NULL, 5),
('4008000101808', 'PREMIER INOX 12 Brochettes', '20.00', NULL, NULL, 5),
('4008000101860', 'PREMIER inox 12 brochettes', '22.00', NULL, NULL, 5),
('4008000102348', 'PREMIER INOX 12 Brochettes + couteau cadeau', '35.00', NULL, NULL, 5),
('4008000104502', 'PREMIER INOX 12 BROCHETTES ', '25.00', NULL, NULL, 5),
('4008000104649', 'PREMIER INOX 12 BROCHETTES+couteau', '30.00', NULL, NULL, 5),
('4015100303773', 'PRET PLUS COCO&CITRON 600ml', '25.00', NULL, NULL, 4),
('4015100304770', 'PRET PLUS EXTRAIT DE MIEL 600ml', '25.00', NULL, NULL, 4),
('4084500617391', 'FAIRY ULTRA Original 780ml', '25.00', NULL, NULL, 2),
('4701512181282', 'OLINA GRANITE 28x28cm BLACK', '190.00', NULL, NULL, 5),
('4701602233181', 'OLINA GRANITE 18/7\"', '75.00', NULL, NULL, 5),
('4701602233204', 'OLINA GRANITE 20cm/8\"', '85.00', NULL, NULL, 5),
('4701602233228', 'OLINA GRANITE 22cm/8.7\"', '90.00', NULL, NULL, 5),
('4701712137058', 'OLINA GRANITE 3-LAYER 26cm forged', '250.00', NULL, NULL, 5),
('4701712137065', 'OLINA GRANITE 3-Layer 28cm forged', '270.00', NULL, NULL, 5),
('4701811024280', 'OLINA GRANITE CASSEROLE 28cm', '310.00', NULL, NULL, 5),
('4701811075206', 'OLINA GRANITE 20cm', '85.00', NULL, NULL, 5),
('4701811075220', 'OLINA GRANITE 22cm', '95.00', NULL, NULL, 5),
('4701811075244', 'OLINA GRANTE 24cm', '130.00', NULL, NULL, 5),
('4701811075282', 'OLINA GRANITE 28cm', '140.00', NULL, NULL, 5),
('4946866303007', 'CUSHION SHEET 45x300cm', '13.00', NULL, NULL, 5),
('5000204034202', 'Raid Liquide Electrique 45 nights', '30.00', NULL, NULL, 5),
('5011321360945', 'H&S CLASSIQUE 400ml', '28.00', NULL, NULL, 4),
('5011321361058', 'H&S FRAICHEUR MENTHOL 400ml', '28.00', NULL, NULL, 4),
('5012254060711', 'TRESemmé Rouge 900ml', '35.00', NULL, NULL, 4),
('5012254060728', 'TRESemmé COLOUR REVITALISE 900ml', '35.00', NULL, NULL, 4),
('5012254061176', 'TRESemmé BLEU 900ml', '35.00', NULL, NULL, 4),
('5054563015440', 'SENSODYNE Soin Gel Fraicheur Intense 75ml', '23.00', NULL, NULL, 4),
('5054563026392', 'SENSODYNE Soin Blancheur 75ml', '23.00', NULL, NULL, 4),
('5054563026439', 'SENSODYNE Soin Gencives 75ml', '23.00', NULL, NULL, 4),
('5054563026477', 'SENSODYNE Soin Complet 75ml', '23.00', NULL, NULL, 4),
('5054563041319', 'SENSIDYNE Soin Contrôle Plaque 75ml', '23.00', NULL, NULL, 4),
('5201143151061', 'SYOSS MEN POWER SHAMPOO 500ml', '23.00', NULL, NULL, 4),
('5201143734035', 'SYOSS MEN CLEAR&COOL SHAMPOO 500ml', '23.00', NULL, NULL, 4),
('5201178027348', 'NIVEA CARE & ORANGE GEL DE DUCHA 750ml', '25.00', NULL, NULL, 4),
('5345680123225', 'Set of 3PCS Hermetic bowl', '75.00', NULL, NULL, 5),
('54024205', 'Signal GEL FRESCO 75ml', '10.00', NULL, NULL, 4),
('5413149635197', 'Ariel DAG ESINTI 6Kg', '110.00', NULL, NULL, 3),
('5704122002458', 'IGT Detendeur de gaz 8mm', '119.00', NULL, NULL, 5),
('5900300056101', 'Signal CAVITY PROTECTION 75ml', '10.00', NULL, NULL, 4),
('5900627073430', 'Air WICK Pure Orange, Grapefruit', '28.00', NULL, NULL, 4),
('5900627073447', 'Air WICK Pure Patchouli, Lavender', '28.00', NULL, NULL, 2),
('6006174000277', 'Dark and Lovely MOISTURE PLUS', '55.00', NULL, NULL, 4),
('6111020281714', 'LUXUS ORIGINAL GLASS ELECTRIC KETTLE', '130.00', NULL, NULL, 5),
('6111024004661', 'TAOUS Liquide Citron 500;l', '17.00', NULL, NULL, 4),
('6111024004685', 'TAOUS Liquide AMANDE 500ml', '17.00', NULL, NULL, 4),
('6111024004708', 'TAOUS Liquide ANTIBACTERIEN', '17.00', NULL, NULL, 4),
('6111041100656', 'Germany Design Oil/Vinegar Dispenser 210 ml', '13.00', NULL, NULL, 8),
('6111041100686', 'Germany Design Oil/Vinegar Dispenser 320ml', '17.00', NULL, NULL, 5),
('6111130001301', 'LAMACOM Moulin a legumes disaues INOX 215mm', '50.00', NULL, NULL, 5),
('6111130002933', 'lAMACOM Couteau HADDA1 12Pcs', '30.00', NULL, NULL, 5),
('6111130003107', 'LAMACOM COUTEAU PRO mache plastique A', '20.00', NULL, NULL, 5),
('6111130003664', 'LAMACOM Couteau PRO INOX +', '55.00', NULL, NULL, 5),
('6111130003817', 'LAMACOM Manche Bois 25cm', '90.00', NULL, NULL, 5),
('6111130003824', 'LAMACOM Manche Bois 18,7cm', '50.00', NULL, NULL, 5),
('6111130004258', 'LAMACOM SAHLA MAHLA', '25.00', NULL, NULL, 5),
('6111130004388', 'LAMACOM BROCHES INOX 12 PIECES+couteau', '40.00', NULL, NULL, 5),
('6111130015735', 'LAMACOM Couteau PRO INOX', '50.00', NULL, NULL, 5),
('6111130026854', 'Look-In Barbecue electrique', '180.00', NULL, NULL, 5),
('6111250480017', 'Essentiel Cahier normal 48 pages', '2.00', NULL, NULL, 9),
('6111250481281', 'Essentiel Recharges Doubles 80 pages', '6.00', NULL, NULL, 9),
('6111252780023', 'NICE PAPAER ultra soft 12 rollos', '20.00', NULL, NULL, 4),
('6111252780146', 'NICE Paper Lemon maxi carta da cucina', '18.00', NULL, NULL, 5),
('6111252780276', 'Zena Paper limon  carta du cucina 2rollos', '18.00', NULL, NULL, 5),
('6111263100483', 'PEGASUS cahier normal 192 pages', '7.00', NULL, NULL, 9),
('6111263812348', 'Pro-one ProVitamine Hydroalocoolique Mains 1L', '100.00', NULL, NULL, 2),
('6111263862299', 'Pro-one ProVitamine Désinfectant Mains 1L', '100.00', NULL, NULL, 2),
('6111263862466', 'AMOR.JR DESINFECTANT pour les mains', '17.00', NULL, NULL, 8),
('6111264152870', 'AQUA Solution Hydroalcoolique 80ml', '16.00', NULL, NULL, 8),
('6114532415516', 'Winox Original ELMOUMTAZ Tea pot #10', '60.00', NULL, NULL, 5),
('6114532416650', 'Winox original ROYAL Tea Pot #10', '60.00', NULL, NULL, 5),
('6114532418043', 'Winox Glass Bakeware ', '75.00', NULL, NULL, 5),
('6114532419347', 'LUXUS Original Tea Pot 48oz', '80.00', NULL, NULL, 5),
('6114532428417', 'LUXUS original Tea Pot 18oz', '60.00', NULL, NULL, 5),
('6114532429391', 'LUXUS original Aluminum Dish Rack', '300.00', NULL, NULL, 5),
('6114620101598', 'PRIMA Pompe a eau 5L', '13.00', NULL, NULL, 5),
('6192101400200', 'Najah Cahier large 96 pages', '7.00', NULL, NULL, 9),
('6192101400927', 'Najah Cahier large 288 pages', '25.00', NULL, NULL, 9),
('6192101401290', 'Najah Cahier normal 288 pages', '11.00', NULL, NULL, 9),
('6192101401351', 'Najah Cahier normal 384 pages', '12.00', NULL, NULL, 9),
('6192101401399', 'Najah Cahier large 144 pages', '11.00', NULL, NULL, 8),
('6192101401436', 'Najah Cahier normal 144 pages', '7.00', NULL, NULL, 9),
('6192101402549', 'Najah Cahier large TP 144 pages', '10.00', NULL, NULL, 9),
('6192101403881', 'Najah Cahier large TP 80 pages', '6.00', NULL, NULL, 9),
('6192400654236', 'Nana MAXI PLUS 10mm 10 Normal', '8.00', NULL, NULL, 4),
('6192400654243', 'Nana MAXI PLUS 10mm 9 Super', '8.00', NULL, NULL, 4),
('6192400655141', 'Nana Maxi 7mm 10 Normal', '10.00', NULL, NULL, 4),
('6192400655158', 'Nana MAXI 7mm 9 Super', '10.00', NULL, NULL, 4),
('6192400658135', 'Nana 5X Plus Respirable 18 slips Long', '10.00', NULL, NULL, 4),
('6192400661708', 'Nana Maxi 7mm 8 Extra Nuit', '10.00', NULL, NULL, 4),
('6200389990013', 'Ivyuan 3alla9a', '10.00', NULL, NULL, 8),
('6202026965972', 'Pro-one ProVitamine pour les mains', '11.00', NULL, NULL, 8),
('6221048407819', 'Signal CAVITY FIGHTER', '10.00', NULL, NULL, 4),
('6221155025265', 'SUNSILK STUNNING BLACK SHINE 350ml', '23.00', NULL, NULL, 4),
('6221155025289', 'SUNSILK INSTANT RESTORE 350ml', '23.00', NULL, NULL, 4),
('6221155025340', 'SUNSILK SOFT&SMOOTH 350ml', '23.00', NULL, NULL, 4),
('6221155046765', 'CLEAR MEN SHOWER FRESH 360ml', '27.00', NULL, NULL, 4),
('6221155047373', 'CLEAR MEN SHOWER FRESH 180ml', '19.00', NULL, NULL, 4),
('6221155052858', 'SUNSILK COCONUT MOISTURE 350ml', '23.00', NULL, NULL, 4),
('6221155058508', 'CLEAR MEN MENTHOL 360ml', '27.00', NULL, NULL, 4),
('6221155065087', 'CLEAR MEN STYLE EXPRESS 360ml', '27.00', NULL, NULL, 4),
('6223002621583', 'IMPERIAL houseware Diamond', '30.00', NULL, NULL, 5),
('6224000979782', 'Pacto Glass LAUREL bowl 235ml 6PCS', '18.00', NULL, NULL, 5),
('6290181017045', 'Luxus Original Aluminium cocotte 5L', '200.00', NULL, NULL, 5),
('6295120029459', 'Air WICK Pure Mediterranean Sun', '28.00', NULL, NULL, 2),
('6295120029466', 'Air WICK Pure Cherry Blossom', '28.00', NULL, NULL, 2),
('6295120031278', 'Air WICK Pure Vanilla', '28.00', NULL, NULL, 2),
('6725316446119', 'KANWOOD INTERNATIONAL Cooking', '160.00', NULL, NULL, 5),
('6806810180819', 'PRANDELLI Stainless steel 5tlg.', '210.00', NULL, NULL, 5),
('6902012764090', 'GUI LONG', '220.00', NULL, NULL, 5),
('6912345612814', 'Tasse & Bouteil kids', '35.00', NULL, NULL, 9),
('6912586921522', 'Genius nicer dicer plus', '70.00', NULL, NULL, 5),
('6920181017014', 'Luxus Original Aluminium cocotte 3L', '150.00', NULL, NULL, 5),
('6923231200251', 'Unbrella plastic', '35.00', NULL, NULL, 8),
('6925452155006', 'LY creative shoe frame 4PCS', '36.00', NULL, NULL, 8),
('6926955659787', 'Juice Press', '10.00', NULL, NULL, 5),
('6931048900202', 'coco Egg slicerm top choice', '25.00', NULL, NULL, 5),
('6931574700208', 'KENZ Fer a repasser vapeur', '140.00', NULL, NULL, 3),
('6933890358422', 'DELISOGA glass sugar bowl', '60.00', NULL, NULL, 5),
('6933890359016', 'Green Apple Deliglassware', '50.00', NULL, NULL, 5),
('6933890363419', 'DELISOGA Aesthetic Crystal-clear', '69.00', NULL, NULL, 5),
('6933890372466', 'DELISOGA Aesthetic Crystal-clear', '12.00', NULL, NULL, 5),
('6935031403121', 'FAQIANE GLASSWARE 310ml 6PCS', '78.00', NULL, NULL, 5),
('6935031403435', 'FAQIANG GLASSWARE 1PC Sauce Bowl Series', '10.00', NULL, NULL, 5),
('6935780100999', 'LUXUS NON STICK FRY PAN 22cm', '100.00', NULL, NULL, 5),
('6941073690924', 'ENJOY LIFE FASHION AND HEALTH ', '20.00', NULL, NULL, 8),
('6942967200984', 'JINGCAIYI Double wall insulated portable pot 1.4L', '75.00', NULL, NULL, 5),
('6943695002895', 'Quality Life Lucky Cleaning Combo', '20.00', NULL, NULL, 2),
('6947802300089', 'Umbrella for kids classic', '25.00', NULL, NULL, 8),
('6947802320193', 'Sinomade umbrella extendable', '50.00', NULL, NULL, 8),
('6947802335128', 'Sinomade umbrella classic', '60.00', NULL, NULL, 8),
('6947981502892', 'JZB accessory hold forks/spoons/knifes', '20.00', NULL, NULL, 5),
('6948223090115', 'CUSHION SHEET 45x200cm', '13.00', NULL, NULL, 8),
('6950406502940', 'QIANLI GLASSWARE 6 PCS', '78.00', NULL, NULL, 5),
('6953440501320', 'RED CHERRY ALDAN MUG 330ml 6PCS ', '48.00', NULL, NULL, 5),
('6953768543293', 'Tasse & Bouteil for kids ', '35.00', NULL, NULL, 9),
('6954141241126', 'SWS Water Purifier', '70.00', NULL, NULL, 5),
('6954215146319', 'Round Strainer Stainless Steel ', '50.00', NULL, NULL, 5),
('6954365301033', 'PREMIUM SPAIN Vacuum pot', '80.00', NULL, NULL, 5),
('6960351499950', 'TRIPLE PAPER DISPENSER', '85.00', NULL, NULL, 5),
('6962585566958', 'GAMM INOX 3PCS ROUND TRAY', '30.00', NULL, NULL, 5),
('6970966880012', 'DIY CLOCK Jingong large', '140.00', NULL, NULL, 5),
('6970966880111', 'DIY CLOCK Jingong small', '120.00', NULL, NULL, 5),
('6971324560492', 'dsp Pro Hair Dyer Straight Brilliance', '200.00', NULL, NULL, 8),
('6971324561123', 'dsp PRO Rechargable Hair Clipper', '100.00', NULL, NULL, 8),
('6971324564964', 'dsp iTrimmer hair trimmer', '110.00', NULL, NULL, 8),
('6971324566432', 'dsp Pro hair styler +3 brush attachments', '300.00', NULL, NULL, 8),
('6971324568757', 'dsp Hot Plate', '190.00', NULL, NULL, 5),
('6971324569464', 'DSP Pro FUTURA DRYER 1200W ', '150.00', NULL, NULL, 8),
('6972427510162', 'Lunch Box one layers 700ml', '25.00', NULL, NULL, 5),
('6979812341653', 'CAKE MOULD 3Pcs', '80.00', NULL, NULL, 5),
('6981655663557', 'LUXUS Original ELMENARA tea pot #6', '50.00', NULL, NULL, 5),
('6981655663625', 'LUXUS Original ELMENARA Tea pot #4', '45.00', NULL, NULL, 5),
('6981655668439', 'LUXUS Original ELMENARA Tea Pot #12', '65.00', NULL, NULL, 5),
('6982019120310', 'Luxus Original Aluminium cocotte 2.5L', '130.00', NULL, NULL, 5),
('6982019120334', 'Luxus Original Aluminium cocotte 4L', '160.00', NULL, NULL, 5),
('6985643789519', 'PVC SELF-ADHESIVE FOIL 45cmx3m', '13.00', NULL, NULL, 5),
('6987586868566', 'dsp Hot Plate 2in1', '250.00', NULL, NULL, 5),
('6987744558353', 'dsp Pro France hair dryer', '250.00', NULL, NULL, 8),
('7322540080032', 'Nana FRESHPROTECT 10 normal', '13.00', NULL, NULL, 4),
('7322540504798', 'Nana FRESH PROTECT 10 ULTRA WINGS', '15.00', NULL, NULL, 4),
('7322540537505', 'Nana DAILYFRESH 28 LONG', '18.00', NULL, NULL, 4),
('7322540826678', 'Nana dailies style 30 Multistyle', '18.00', NULL, NULL, 4),
('8001090134226', 'Dodot WET WIPES 64', '13.00', NULL, NULL, 4),
('8001841506937', 'ARIEL COLOUR ALL in 1 833g', '85.00', NULL, NULL, 2),
('80466468', 'Dove original moisturing cream 50ml', '18.00', NULL, NULL, 4),
('8410046611238', 'Flota ACTIVE PLUS MARSELLA 45 LAVADOS 4,5Kg', '45.00', NULL, NULL, 2),
('8410046611320', 'flota ACTIVE PLUS 84 LAVADOS 5,04Kg', '105.00', NULL, NULL, 2),
('8410046661233', 'flota active plus Marsella 4,95L', '70.00', NULL, NULL, 2),
('8410104042066', 'ELENA BLANCOS Y COLORES 35 2,17Kg', '45.00', NULL, NULL, 2),
('8410104069117', 'Finish SAL 2KG', '40.00', NULL, NULL, 2),
('8410104084011', 'Vanish PowerGel COLON 4,489L', '90.00', NULL, NULL, 2),
('8410104156664', 'Air WICK Oasis Turquesa', '23.00', NULL, NULL, 2),
('8410104880118', 'flor azul frescor superior 1980ml', '25.00', NULL, NULL, 2),
('8410104882884', 'Air WICK life scents 60 DIAS', '60.00', NULL, NULL, 2),
('8410104890230', 'flor Elixir Herbal 1200ml', '30.00', NULL, NULL, 2),
('8410104892982', 'flor Revive Azur 1200ml', '30.00', '0.00', NULL, 2),
('8410104895020', 'flor Elixir Aquamarine 1200ml', '30.00', NULL, NULL, 2),
('8410104895037', 'flor Elixir Temptation 1200ml ', '30.00', NULL, NULL, 2),
('8410436130172', 'SYOSS COLORTECH 500ml', '23.00', NULL, NULL, 4),
('8410436230254', 'SYOSS KERATIN 500ml', '23.00', NULL, NULL, 4),
('8410436243094', 'WiPP EXPRESS Vernel 31 1,860Kg', '48.00', NULL, NULL, 2),
('8410436308847', 'SYOSS RIZOSPRO 500ml', '23.00', NULL, NULL, 4),
('841043632837', 'SYOSS SALONPLEX 500ml', '23.00', NULL, NULL, 4),
('8410436361668', 'WiPP EXPRESS 4L', '98.00', NULL, NULL, 2),
('8410761000409', 'Lejia LAGARTO Azul 1500ml', '10.00', NULL, NULL, 2),
('8410761001130', 'LAGARTO Lejia super 2000ml', '13.00', NULL, NULL, 2),
('8410761002052', 'Lejia LAGARTO Limon 1500ml', '10.00', NULL, NULL, 2),
('8410761002069', 'Lejia LAGARTO Pino 1500ml', '10.00', NULL, NULL, 2),
('8410761006746', 'FREGASUELOS LAGARTO Pino', '10.00', NULL, NULL, 2),
('841076100677', 'FREGASUELOS LAGARTO flor de Cerezo 1,5L', '10.00', NULL, NULL, 2),
('8410761010538', 'Detergente LAGARTO Aloe 2960ml', '45.00', NULL, NULL, 2),
('8410761300110', 'alpes detergente 35 dosis', '35.00', NULL, NULL, 3),
('8410761301100', 'alpes detergente 70 dosis', '60.00', NULL, NULL, 3),
('8410761302022', 'Lavavajillas LAGARTO Todo en uno 40 800g', '50.00', NULL, NULL, 2),
('8410761302305', 'LAGARTO Sal Lavavajillas 2Kg', '15.00', NULL, NULL, 2),
('8410761700040', 'Lavavajillas LAGARTO concetrado ulta 750ml', '8.00', NULL, NULL, 2),
('8410761800511', 'LAGARTO Suavizante Clasico Azur 1260ml', '13.00', NULL, NULL, 2),
('8410761800528', 'LAGARTO suavizante clasico Talco 1260ml', '13.00', NULL, NULL, 2),
('8410836217091', 'INSECTICIDA SILO Limon Miton 750ml', '20.00', NULL, NULL, 2),
('8410836217107', 'INSECTICIDA Silo Limon 200ml', '13.00', NULL, NULL, 2),
('8411047103579', 'INSTITUTO ESPANOL AROMATERAPIA DUCHA 750ml', '22.00', NULL, NULL, 4),
('8411047108208', 'INSTITUTO ESPANOL lactoadvance ducha 750ml', '22.00', NULL, NULL, 4),
('8411135420892', 'Lida JABON de gliverina aloe vera 600ml', '25.00', NULL, NULL, 4),
('8411712015305', 'Bormioli Cibeles 6 PCS', '25.00', NULL, NULL, 5),
('8414011752100', 'toyma Tendedero Automatico', '95.00', NULL, NULL, 2),
('8414244117066', 'PREMIER SPAIN CAFETERA EXPRES vitro', '85.00', NULL, NULL, 5),
('8420568030400', 'Amber gotaa gota Agerul 125ml', '12.00', NULL, NULL, 2),
('8420568030608', 'Jazmine gotaa gota Agerul 125ml', '12.00', NULL, NULL, 2),
('8420568900031', 'AGERUL Concentrado 750+150ml GRATIS', '35.00', NULL, NULL, 2),
('8433111002113', 'Foxy Cartapaglia JUMBO 250 servicios', '25.00', NULL, NULL, 5),
('8433111002878', 'Foxy Tornado STRONG 300 servicios', '40.00', NULL, NULL, 5),
('8433295030681', 'MAYOR DOMOQ FREGASUELOS COLONIA 1,5L', '13.00', NULL, NULL, 2),
('8433295030698', 'MAYOR DOMO FLORAL 1,5L', '13.00', NULL, NULL, 2),
('8433295030704', 'MAYOR DOMO FREGASUELOS SPA 1,5L', '13.00', NULL, NULL, 2),
('8433295030711', 'MAYOR DOMO FREGASUELOD TALCO 1,5L', '13.00', NULL, NULL, 2),
('8433295031510', 'AGRADO CREMA CABELLOS NORMALES 750ml', '15.00', NULL, NULL, 4),
('8433295031527', 'AGRADO CREMA FRAGILES O SENSIBLES 750ml', '15.00', NULL, NULL, 4),
('8433295033163', 'AGRADOR REPARADOR NUTRITIVO 750ml', '20.00', NULL, NULL, 4),
('8433295033187', 'AGRADO REGULADOR ANTICASPA 750ml', '20.00', NULL, NULL, 4),
('8433295033378', 'AGRADO FAMILIAR GEL/CHAMPU USO FRECUENTE 1250ml', '20.00', NULL, NULL, 4),
('8433295036324', 'AGRADO AGUA DE COLONIA FRESCA 750ml', '20.00', NULL, NULL, 4),
('8433295038045', 'AGRADO GEL BANO&DUCHA 750ml', '18.00', NULL, NULL, 4),
('8433295040062', 'AGRADO GEL SALES MARINAS 750ml', '18.00', NULL, NULL, 4),
('8433295040918', 'AGRADO FAMILIAR BANO&DUCHA ROSA MOSQUETA 1250ml', '20.00', NULL, NULL, 4),
('8433295040925', 'AGRADO FAMILIAR CHAMPU TODO TIPO DE CABELLOS 1250ml', '20.00', NULL, NULL, 4),
('8433295044091', 'AGRADO TONICO FACIAL 250ml', '18.00', NULL, NULL, 4),
('8433295048280', 'AGRADOR KERATINA', '20.00', NULL, NULL, 4),
('8433295051051', 'AGRADO AGUA MICELAR 250ml', '18.00', NULL, NULL, 4),
('8433295051594', 'AGRADO Baby CHAMPU SUAVE CAMOMILA 590ml', '18.00', NULL, NULL, 4),
('8433295051617', 'AGRADO Baby JUBON LIQUIDO ALOE VERA 590ml', '18.00', NULL, NULL, 4),
('8433295051624', 'AGRADO LOCION HIDRATANTE ALOE VERA 590ml', '23.00', NULL, NULL, 4),
('8433295052867', 'AGRADO GEL VAINILLA 750ml', '18.00', NULL, NULL, 4),
('8433295053253', 'MAYOR DOMO GEL ROPE DE COLOR 3L', '40.00', NULL, NULL, 2),
('8433295054915', 'AGRADO FAMILAR GEL BANO SALES MINERALES 1250ml', '20.00', NULL, NULL, 4),
('8433295054922', 'AGRADO BANO&DUCHA Arena XXL 1250ml', '20.00', NULL, NULL, 4),
('8433295054984', 'AGRADO CREMA HIPOALERGENICA 50ml', '42.00', NULL, NULL, 4),
('8433295055004', 'AGRADO CREMA DE DIA 50ml', '42.00', NULL, NULL, 4),
('8433295056469', 'AGRADO GEL FIJADOR 200ml', '18.00', NULL, NULL, 4),
('8433295059613', 'AGRADO CHAMPU COLORTERAPIA C 750ml', '20.00', NULL, NULL, 4),
('8433295059620', 'AGRADO CREMA COLORTERAPIA C 750ml', '15.00', NULL, NULL, 4),
('8433295059637', 'AGRADO MASCARILLA COLORTERAPIA 500ml', '25.00', NULL, NULL, 4),
('8433295062576', 'AGRADO SERUM BRILLO INTENSO 200ml', '45.00', NULL, NULL, 4),
('8433295062583', 'AGRADO ACEITE MULTI VITAMINAS 200ml', '50.00', NULL, NULL, 4),
('8435495805281', 'A+ XXL OPTIMAL 4,2Kg', '105.00', NULL, NULL, 2),
('8435495805373', 'A+ FRESH FLOWERS', '120.00', NULL, NULL, 2),
('8436032039251', 'ALEXE NETTOYANT LAVE VITRES 750ml', '13.00', NULL, NULL, 2),
('8436578920273', 'MARCHICA SACS 20', '10.00', NULL, NULL, 5),
('8437005901261', 'Foxy TORNADO AZUL 340 servicios 1KG', '30.00', NULL, NULL, 5),
('8437005901452', 'Foxy Bouquet 4 rollos + 2 gratis', '23.00', NULL, NULL, 4),
('8437005901551', 'Foxy MEGA3 papel cocina 2MEGA', '20.00', NULL, NULL, 5),
('8437013951432', 'FORMIL 30L 40 SACS 55x58cm', '18.00', NULL, NULL, 5),
('8437013991018', 'BRiSK XXL COLOR intenso 3L', '40.00', NULL, NULL, 2),
('8437013991049', 'BRiSK XXL Rosa Mosqueta 3L', '40.00', NULL, NULL, 2),
('8437013991070', 'BRiSK EXCELLENT 90 LAVADOS + 10 GRATIS 7,2Kg', '95.00', NULL, NULL, 2),
('8437013991094', 'BRisK 130 LAVADOS + 12 GRATIS 10 Kg', '90.00', NULL, NULL, 2),
('8680465147285', 'LUXUS original PLANCHE GRILL GRANITE 47x28.5cm', '190.00', NULL, NULL, 5),
('8680734005575', 'Bumble WET WIPES 120', '13.00', NULL, NULL, 4),
('8681183021130', 'VIDREX Derya', '20.00', NULL, NULL, 5),
('8690530204478', 'Selpak Super Soft 24 toilet paper', '75.00', NULL, NULL, 2),
('8690530834118', 'Selpak Super Soft 9 toilet paper', '28.00', NULL, NULL, 4),
('8691857001276', 'Rose Ventouse Pump', '15.00', NULL, NULL, 2),
('8692952050503', 'LAV 6 FILIZ 7oz', '25.00', NULL, NULL, 5),
('8697480545033', 'tuffex poubelle TP-4503 14L', '200.00', NULL, NULL, 2),
('8697641781867', 'Stemmed crumb brush ', '20.00', NULL, NULL, 2),
('8697926007262', 'RedOne QUIKSILVER 150ml', '20.00', NULL, NULL, 4),
('8697926007422', 'RedOne BLUE 150ml', '20.00', NULL, NULL, 4),
('8697926016257', 'RedOne VIOLETTA 150ml', '20.00', NULL, NULL, 4),
('8697926023286', 'RedOne COBRA AQUA 150ml', '20.00', NULL, NULL, 4),
('8699880066682', 'coco KITCHEN WARE ', '20.00', NULL, NULL, 5),
('8710447171318', 'Rexona Active Protection+ invisible 200ml', '20.00', NULL, NULL, 4),
('8710447223352', 'TRESemmé VIOLET 700ml', '35.00', NULL, NULL, 4),
('8710447223420', 'TRESemmé LISO KERATINA 700ml', '35.00', NULL, NULL, 4),
('8710447328088', 'Signal INTEGRAL8 HERBAL 75ml', '15.00', NULL, NULL, 4),
('8710447328095', 'Signal INTEGRAL8 COCO 75ml', '15.00', NULL, NULL, 4),
('8710447492154', 'Rexona Active Protection+ fresh 200ml', '20.00', NULL, NULL, 4),
('8710522316320', 'TRESemmé Vert 900ml', '35.00', NULL, NULL, 4),
('8711600410367', 'Rexona Invisible Aqua 200ml', '20.00', NULL, NULL, 4),
('8711600533806', 'Dove MEN+CARE Invisible Dry 250ml', '23.00', NULL, NULL, 4),
('8714100019740', 'Rexona Cotton Dry 200ml', '20.00', NULL, NULL, 4),
('8714100019757', 'Rexona antibacterial protectionx10 200ml', '20.00', NULL, NULL, 4),
('8714789700069', 'PALMOLIVE NATURALS savon 90g', '7.00', NULL, NULL, 4),
('8714789765662', 'Sanex Dermo Sensitive 200ml', '20.00', NULL, NULL, 4),
('8714789823775', 'Colgate Classic DEEP CLEAN', '7.00', NULL, NULL, 4),
('8717163607268', 'Dove gentle exfoliating 100g', '6.00', NULL, NULL, 4),
('8718951184350', 'Sanex DERMO PRO HYDRATE 600ml', '23.00', NULL, NULL, 4),
('8718951185432', 'Sanex DERMO ACEITE 600ml', '23.00', NULL, NULL, 4),
('8718951185630', 'Sanex DERMO SENSITIVE 600ml', '23.00', NULL, NULL, 4),
('8718951187818', 'Sanex TOLERANCE 600ml', '23.00', NULL, NULL, 4),
('8718951187849', 'Sanex NO SOAP 600ml', '23.00', NULL, NULL, 4),
('8718951196216', 'Sanex ZERO- DRY SKIN 600ml', '23.00', NULL, NULL, 4),
('8718951205345', 'Sanex EQUILIBRANTE 600+150ml free', '25.00', NULL, NULL, 4),
('87189951184459', 'Sanex DERMO PROTECTOR 600ml', '23.00', NULL, NULL, 4),
('8809556659432', 'LUXUS ORIGINAL Orange juicer', '120.00', NULL, NULL, 5),
('8850006324424', 'Colgate Protection Caries 100ml', '10.00', NULL, NULL, 4),
('8901009111631', 'MISWAK 120g + FREE 50g', '10.00', NULL, NULL, 4),
('8941321654188', 'MICROFIBER SPRAY MOP', '110.00', NULL, NULL, 2),
('8945744125324', 'Steel Moon LA MEZZALUNA ', '14.00', NULL, NULL, 5),
('8976165651963', 'Najah Cahier large 96 pages', '7.00', NULL, NULL, 8),
('8976165896012', 'Najah Cahier normal 96 pages', '3.50', NULL, NULL, 9),
('8976445455809', 'Najah Cahier large 80 pages', '6.00', NULL, NULL, 9),
('8976445473803', 'Najah Cahier normal 80 pages', '3.00', NULL, NULL, 9),
('8976445815351', 'Najah registre 300 pages', '30.00', NULL, NULL, 9),
('8976445815573', 'Najah Registre 500 pages', '40.00', NULL, NULL, 9),
('8976445815689', 'Najah Registre 200 pages', '25.00', NULL, NULL, 9),
('8976486551447', 'Najah Cahier large 144 pages', '10.00', NULL, NULL, 9),
('8976548651924', 'Najah Cahier normal 192 pages', '7.00', NULL, NULL, 9);

-- --------------------------------------------------------

--
-- Table structure for table `scategorie`
--

DROP TABLE IF EXISTS `scategorie`;
CREATE TABLE IF NOT EXISTS `scategorie` (
  `ID` int(6) NOT NULL,
  `NOM` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `scategorie`
--

INSERT INTO `scategorie` (`ID`, `NOM`) VALUES
(0, 'Jouets'),
(1, '5_Dhs'),
(2, 'Ménage'),
(3, 'Electroménager'),
(4, 'Beauté'),
(5, 'Cuisine'),
(6, 'Textile'),
(7, 'Bijouterie'),
(8, 'Accessoires'),
(9, 'Autres');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
CREATE TABLE IF NOT EXISTS `transaction` (
  `ID` int(32) NOT NULL,
  `TIME` datetime NOT NULL,
  `PT` decimal(8,2) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`ID`, `TIME`, `PT`) VALUES
(1, '0000-00-00 00:00:00', '0.00'),
(2, '2020-09-13 16:46:53', '115.00'),
(3, '2021-02-24 12:45:02', '360.00'),
(4, '2021-03-02 13:40:13', '75.00');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cmd`
--
ALTER TABLE `cmd`
  ADD CONSTRAINT `cmd_ibfk_1` FOREIGN KEY (`ID_PRODUIT`) REFERENCES `produit` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `produit_ibfk_1` FOREIGN KEY (`ID_SCATEGORIE`) REFERENCES `scategorie` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
