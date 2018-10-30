--
-- Table structure for table `send_log_aggregated`
--

CREATE TABLE `send_log_aggregated` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `cnt_id` int(11) NOT NULL,
  `usr_id` int(11) NOT NULL,
  `success` int(255) NOT NULL,
  `failed` int(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `send_log_aggregated`
-- Data for example

INSERT INTO `send_log_aggregated` (`id`, `date`, `cnt_id`, `usr_id`, `success`, `failed`) VALUES
(1, '2018-10-13', 1, 1, 1, 0),
(2, '2018-12-12', 1, 1, 3, 1),
(3, '2017-07-12', 2, 1, 1, 0),
(4, '2018-10-10', 2, 1, 0, 1),
(5, '2018-11-11', 1, 2, 0, 1),
(6, '2018-11-19', 2, 2, 0, 1),
(7, '2018-11-10', 2, 2, 0, 1),
(8, '2018-11-02', 1, 3, 0, 1),
(9, '2018-12-11', 2, 3, 1, 0),
(10, '2018-12-09', 1, 4, 0, 1),
(11, '2018-12-23', 1, 4, 1, 0),
(12, '2018-11-19', 2, 4, 0, 1),
(13, '2018-12-21', 1, 5, 0, 1),
(14, '2018-11-19', 2, 6, 2, 0),
(15, '2018-11-20', 2, 6, 1, 0),
(16, '2018-11-29', 2, 6, 0, 1);

-- --------------------------------------------------------

-- Get data from all rows in send log table and truncate send_log table

INSERT INTO send_log_aggregated (date,usr_id,cnt_id,success,failed)
SELECT 
DATE_FORMAT(log_created, "%Y-%m-%d") as date,
usr_id, 
cnt_id, 
COUNT ( CASE WHEN  log_success = 1 THEN  1 END ) AS success,
COUNT ( CASE WHEN  log_success = 0 THEN  1 END ) AS failed
FROM send_log left join numbers ON send_log.num_id = numbers.num_id
GROUP BY usr_id,send_log.num_id,log_created;

TRUNCATE TABLE send_log;

-- Get data from rows in send log table by date and delete rows in send_log table by date

INSERT INTO send_log_aggregated (date,usr_id,cnt_id,success,failed)
SELECT 
DATE_FORMAT(log_created, "%Y-%m-%d") as date,
usr_id, 
cnt_id, 
COUNT ( CASE WHEN  log_success = 1 THEN  1 END ) AS success,
COUNT ( CASE WHEN  log_success = 0 THEN  1 END ) AS failed
FROM send_log left join numbers ON send_log.num_id = numbers.num_id WHERE send_log.log_created = 'selected date'
GROUP BY usr_id,send_log.num_id,log_created;

DELETE FROM send_log WHERE log_created = 'selected date';
