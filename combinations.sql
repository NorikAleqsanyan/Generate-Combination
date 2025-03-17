SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";



CREATE TABLE `combinations` (
  `id` int(11) NOT NULL,
  `combination` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`combination`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `combinations` (`id`, `combination`) VALUES
(1, '[[\"A1\",\"B1\"],[\"A1\",\"B2\"],[\"A1\",\"C1\"],[\"B1\",\"C1\"],[\"B2\",\"C1\"]]'),
(2, '[[\"A1\",\"B1\"],[\"A1\",\"B2\"],[\"A1\",\"C1\"],[\"A2\",\"B1\"],[\"A2\",\"B2\"],[\"A2\",\"C1\"],[\"B1\",\"C1\"],[\"B2\",\"C1\"]]');


ALTER TABLE `combinations`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `combinations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

