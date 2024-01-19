-- SQL drop tables:
DROP TABLE IF EXISTS [RankingScrutiny.Program];
DROP TABLE IF EXISTS [RankingScrutiny.ProgramCategory];
DROP TABLE IF EXISTS [RankingScrutiny.ProgramType];
DROP TABLE IF EXISTS [RankingScrutiny.RankingSource];
DROP TABLE IF EXISTS [RankingScrutiny.Rank];

--SQL create tables:

CREATE TABLE [RankingScrutiny.ProgramCategory] (
	prgCtgryId VARCHAR (2) NOT NULL,
	prgCtgryName VARCHAR (30),
	CONSTRAINT pk_ProgramCategory_prgCtgryId PRIMARY KEY (prgCtgryId),
);


CREATE TABLE [RankingScrutiny.ProgramType] (
	prgTypeId VARCHAR (2) NOT NULL,
	prgTypeName VARCHAR (30) NOT NULL,
	CONSTRAINT pk_ProgramType_prgTypeId PRIMARY KEY (prgTypeId)
);

CREATE TABLE [RankingScrutiny.RankingSource] (
	rnkngSrcId VARCHAR (2) NOT NULL,
	rnkngSrcName VARCHAR (30),
	CONSTRAINT pk_RankingSource_rnkngSrcId PRIMARY KEY (rnkngSrcId)
);


CREATE TABLE [RankingScrutiny.Program] (
	programId VARCHAR (2) NOT NULL,
	programName VARCHAR (50),
	prgCtgryId VARCHAR (2),
	prgTypeId VARCHAR (2),
	CONSTRAINT pk_Program_programId PRIMARY KEY (programId),
	CONSTRAINT fk_Program_prgCtgryId FOREIGN KEY (prgCtgryId)
		REFERENCES [RankingScrutiny.ProgramCategory] (prgCtgryId)
		ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_ProgramType_prgTypeId FOREIGN KEY (prgTypeId)
		REFERENCES [RankingScrutiny.ProgramType] (prgTypeId)
		ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE [RankingScrutiny.Rank] (
	programId VARCHAR (2) NOT NULL, 
	rnkngSrcId VARCHAR (2) NOT NULL, 
	rankingYear INTEGER NOT NULL, 
	rankingPosition INTEGER, 
	rankingPositionPrevYear INTEGER,
	CONSTRAINT pk_Rank_programId_rnkngSrcId_rankingYear PRIMARY KEY (programId, rnkngSrcId, rankingYear),
	CONSTRAINT fk_Rank_programId FOREIGN KEY (programId)
		REFERENCES [RankingScrutiny.Program] (programId)
		ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_Rank_rnkngSrcId FOREIGN KEY (rnkngSrcId)
		REFERENCES [RankingScrutiny.RankingSource] (rnkngSrcId)
		ON DELETE CASCADE ON UPDATE CASCADE
);


--SQL insert data

INSERT INTO [RankingScrutiny.ProgramCategory] (prgCtgryId, prgCtgryName) VALUES 
    (1, 'MBA'),
    (2, 'Masters'),
    (3, 'Masters of Science'),
    (4, 'Online Masters');

INSERT INTO [RankingScrutiny.ProgramType] (prgTypeId, prgTypeName) VALUES 
    (1, 'Full time'),
    (2, 'Part-Time');

INSERT INTO [RankingScrutiny.RankingSource] (rnkngSrcId, rnkngSrcName) VALUES 
    (1, 'US News'),
    (2, 'QS World University Rankings'),
    (3, 'Financial Times');

INSERT INTO [RankingScrutiny.Program] (programId, programName, prgCtgryId, prgTypeId) VALUES 
    (1, 'AI and Business Strategy', 1, 1),
    (2, 'Finance', 1, 1),
    (3, 'Marketing', 1, 1),
    (4, 'Sustainability', 1, 1),
    (5, 'Consulting', 1, 2),
    (6, 'Finance', 2, 2),
    (7, 'Management Studies', 2, 1),
    (8, 'Quantitative Finance', 2, 1),
    (9, 'Accounting', 3, 1),
    (10, 'Supply Chain Management', 3, 1),
    (11, 'Supply Chain Management', 3, 2),
    (12, 'Information Systems', 3, 1),
    (13, 'Business Analytics', 4, 1),
    (14, 'Business Analytics', 4, 2),
    (15, 'Information Systems', 4, 1);


INSERT INTO [RankingScrutiny.Rank] (programId, rnkngSrcId, rankingYear, rankingPosition, rankingPositionPrevYear) VALUES
    (1, 1, 2021, 24, NULL),
    (1, 1, 2022, 19, 24),
    (1, 1, 2023, 15, 19),
    (1, 2, 2021, 28, NULL),
    (1, 2, 2022, 24, 28),
    (1, 2, 2023, 20, 24),
    (2, 1, 2021, 30, NULL),
    (2, 1, 2022, 23, 30),
    (2, 1, 2023, 26, 23),
    (2, 2, 2021, 41, NULL),
    (2, 2, 2022, 44, 41),
    (2, 2, 2023, 44, 44),
    (2, 3, 2021, NULL, NULL),
    (2, 3, 2022, 54, NULL),
    (2, 3, 2023, 55, 54),
    (3, 1, 2021, 37, NULL),
    (3, 1, 2022, 35, 37),
    (3, 1, 2023, 32, 35),
    (3, 2, 2021, 34, NULL),
    (3, 2, 2022, 37, 34),
    (3, 2, 2023, 39, 37),
    (4, 1, 2021, 39, NULL),
    (4, 1, 2022, 35, 39),
    (4, 1, 2023, 31, 35),
    (4, 2, 2021, 43, NULL),
    (4, 2, 2022, 38, 43),
    (4, 2, 2023, 38, 38),
    (5, 1, 2021, 28, NULL),
    (5, 1, 2022, 23, 28),
    (5, 1, 2023, 21, 23),
    (5, 2, 2021, 32, NULL),
    (5, 2, 2022, 30, 32),
    (5, 2, 2023, 19, 30),
    (6, 1, 2021, 24, NULL),
    (6, 1, 2022, 21, 24),
    (6, 1, 2023, 19, 21),
    (6, 2, 2021, 28, NULL),
    (6, 2, 2022, 23, 28),
    (6, 2, 2023, 20, 23),
    (7, 1, 2021, 75, NULL),
    (7, 1, 2022, 70, 75),
    (7, 1, 2023, 68, 70),
    (7, 2, 2021, 58, NULL),
    (7, 2, 2022, 78, 58),
    (7, 2, 2023, 64, 78),
    (7, 3, 2021, 52, NULL),
    (7, 3, 2022, 85, 52),
    (7, 3, 2023, 57, 85),
    (8, 1, 2021, 53, NULL),
    (8, 1, 2022, 48, 53),
    (8, 1, 2023, 45, 48),
    (8, 2, 2021, 51, NULL),
    (8, 2, 2022, 43, 51),
    (8, 2, 2023, 37, 43),
    (9, 1, 2021, 42, NULL),
    (9, 1, 2022, 26, 42),
    (9, 1, 2023, 24, 26),
    (9, 2, 2021, 52, NULL),
    (9, 2, 2022, 36, 52),
    (9, 2, 2023, 35, 36),
    (10, 1, 2021, 27, NULL),
    (10, 1, 2022, 25, 27),
    (10, 1, 2023, 23, 25),
    (10, 2, 2021, 24, NULL),
    (10, 2, 2022, 26, 24),
    (10, 2, 2023, 28, 26),
    (11, 1, 2021, 28, NULL),
    (11, 1, 2022, 27, 28),
    (11, 1, 2023, 23, 27),
    (11, 2, 2021, 24, NULL),
    (11, 2, 2022, 26, 24),
    (11, 2, 2023, 28, 26),
    (12, 1, 2021, 14, NULL),
    (12, 1, 2022, 13, 14),
    (12, 1, 2023, 11, 13),
    (12, 2, 2021, 13, NULL),
    (12, 2, 2022, 12, 13),
    (12, 2, 2023, 9, 12),
    (13, 1, 2021, 46, NULL),
    (13, 1, 2022, 47, 46),
    (13, 1, 2023, 43, 47),
    (13, 2, 2021, 25, NULL),
    (13, 2, 2022, 31, 25),
    (13, 2, 2023, 38, 31),
    (14, 1, 2021, 46, NULL),
    (14, 1, 2022, 47, 46),
    (14, 1, 2023, 43, 47),
    (14, 2, 2021, 25, NULL),
    (14, 2, 2022, 31, 25),
    (14, 2, 2023, 38, 31),
    (15, 1, 2021, 37, NULL),
    (15, 1, 2022, 31, 37),
    (15, 1, 2023, 30, 31),
    (15, 2, 2021, 35, NULL),
    (15, 2, 2022, 34, 35),
    (15, 2, 2023, 33, 34);


USE BUDT702_Project_0501_08

-- SQL drop tables:
DROP TABLE IF EXISTS [RankingScrutiny.Program];
DROP TABLE IF EXISTS [RankingScrutiny.ProgramCategory];
DROP TABLE IF EXISTS [RankingScrutiny.ProgramType];
DROP TABLE IF EXISTS [RankingScrutiny.RankingSource];
DROP TABLE IF EXISTS [RankingScrutiny.Rank];

--SQL create tables:

CREATE TABLE [RankingScrutiny.ProgramCategory] (
	prgCtgryId VARCHAR (2) NOT NULL,
	prgCtgryName VARCHAR (30),
	CONSTRAINT pk_ProgramCategory_prgCtgryId PRIMARY KEY (prgCtgryId),
);


CREATE TABLE [RankingScrutiny.ProgramType] (
	prgTypeId VARCHAR (2) NOT NULL,
	prgTypeName VARCHAR (30) NOT NULL,
	CONSTRAINT pk_ProgramType_prgTypeId PRIMARY KEY (prgTypeId)
);

CREATE TABLE [RankingScrutiny.RankingSource] (
	rnkngSrcId VARCHAR (2) NOT NULL,
	rnkngSrcName VARCHAR (30),
	CONSTRAINT pk_RankingSource_rnkngSrcId PRIMARY KEY (rnkngSrcId)
);


CREATE TABLE [RankingScrutiny.Program] (
	programId VARCHAR (2) NOT NULL,
	programName VARCHAR (50),
	prgCtgryId VARCHAR (2),
	prgTypeId VARCHAR (2),
	CONSTRAINT pk_Program_programId PRIMARY KEY (programId),
	CONSTRAINT fk_Program_prgCtgryId FOREIGN KEY (prgCtgryId)
		REFERENCES [RankingScrutiny.ProgramCategory] (prgCtgryId)
		ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_ProgramType_prgTypeId FOREIGN KEY (prgTypeId)
		REFERENCES [RankingScrutiny.ProgramType] (prgTypeId)
		ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE [RankingScrutiny.Rank] (
	programId VARCHAR (2) NOT NULL, 
	rnkngSrcId VARCHAR (2) NOT NULL, 
	rankingYear INTEGER NOT NULL, 
	rankingPosition INTEGER, 
	rankingPositionPrevYear INTEGER,
	CONSTRAINT pk_Rank_programId_rnkngSrcId_rankingYear PRIMARY KEY (programId, rnkngSrcId, rankingYear),
	CONSTRAINT fk_Rank_programId FOREIGN KEY (programId)
		REFERENCES [RankingScrutiny.Program] (programId)
		ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT fk_Rank_rnkngSrcId FOREIGN KEY (rnkngSrcId)
		REFERENCES [RankingScrutiny.RankingSource] (rnkngSrcId)
		ON DELETE CASCADE ON UPDATE CASCADE
);


--SQL insert data

INSERT INTO [RankingScrutiny.ProgramCategory] (prgCtgryId, prgCtgryName) VALUES 
    (1, 'MBA'),
    (2, 'Masters'),
    (3, 'Masters of Science'),
    (4, 'Online Masters');

INSERT INTO [RankingScrutiny.ProgramType] (prgTypeId, prgTypeName) VALUES 
    (1, 'Full time'),
    (2, 'Part-Time');

INSERT INTO [RankingScrutiny.RankingSource] (rnkngSrcId, rnkngSrcName) VALUES 
    (1, 'US News'),
    (2, 'QS World University Rankings'),
    (3, 'Financial Times');

INSERT INTO [RankingScrutiny.Program] (programId, programName, prgCtgryId, prgTypeId) VALUES 
    (1, 'AI and Business Strategy', 1, 1),
    (2, 'Finance', 1, 1),
    (3, 'Marketing', 1, 1),
    (4, 'Sustainability', 1, 1),
    (5, 'Consulting', 1, 2),
    (6, 'Finance', 2, 2),
    (7, 'Management Studies', 2, 1),
    (8, 'Quantitative Finance', 2, 1),
    (9, 'Accounting', 3, 1),
    (10, 'Supply Chain Management', 3, 1),
    (11, 'Supply Chain Management', 3, 2),
    (12, 'Information Systems', 3, 1),
    (13, 'Business Analytics', 4, 1),
    (14, 'Business Analytics', 4, 2),
    (15, 'Information Systems', 4, 1);


INSERT INTO [RankingScrutiny.Rank] (programId, rnkngSrcId, rankingYear, rankingPosition, rankingPositionPrevYear) VALUES
    (1, 1, 2021, 24, NULL),
    (1, 1, 2022, 19, 24),
    (1, 1, 2023, 15, 19),
    (1, 2, 2021, 28, NULL),
    (1, 2, 2022, 24, 28),
    (1, 2, 2023, 20, 24),
    (2, 1, 2021, 30, NULL),
    (2, 1, 2022, 23, 30),
    (2, 1, 2023, 26, 23),
    (2, 2, 2021, 41, NULL),
    (2, 2, 2022, 44, 41),
    (2, 2, 2023, 44, 44),
    (2, 3, 2021, NULL, NULL),
    (2, 3, 2022, 54, NULL),
    (2, 3, 2023, 55, 54),
    (3, 1, 2021, 37, NULL),
    (3, 1, 2022, 35, 37),
    (3, 1, 2023, 32, 35),
    (3, 2, 2021, 34, NULL),
    (3, 2, 2022, 37, 34),
    (3, 2, 2023, 39, 37),
    (4, 1, 2021, 39, NULL),
    (4, 1, 2022, 35, 39),
    (4, 1, 2023, 31, 35),
    (4, 2, 2021, 43, NULL),
    (4, 2, 2022, 38, 43),
    (4, 2, 2023, 38, 38),
    (5, 1, 2021, 28, NULL),
    (5, 1, 2022, 23, 28),
    (5, 1, 2023, 21, 23),
    (5, 2, 2021, 32, NULL),
    (5, 2, 2022, 30, 32),
    (5, 2, 2023, 19, 30),
    (6, 1, 2021, 24, NULL),
    (6, 1, 2022, 21, 24),
    (6, 1, 2023, 19, 21),
    (6, 2, 2021, 28, NULL),
    (6, 2, 2022, 23, 28),
    (6, 2, 2023, 20, 23),
    (7, 1, 2021, 75, NULL),
    (7, 1, 2022, 70, 75),
    (7, 1, 2023, 68, 70),
    (7, 2, 2021, 58, NULL),
    (7, 2, 2022, 78, 58),
    (7, 2, 2023, 64, 78),
    (7, 3, 2021, 52, NULL),
    (7, 3, 2022, 85, 52),
    (7, 3, 2023, 57, 85),
    (8, 1, 2021, 53, NULL),
    (8, 1, 2022, 48, 53),
    (8, 1, 2023, 45, 48),
    (8, 2, 2021, 51, NULL),
    (8, 2, 2022, 43, 51),
    (8, 2, 2023, 37, 43),
    (9, 1, 2021, 42, NULL),
    (9, 1, 2022, 26, 42),
    (9, 1, 2023, 24, 26),
    (9, 2, 2021, 52, NULL),
    (9, 2, 2022, 36, 52),
    (9, 2, 2023, 35, 36),
    (10, 1, 2021, 27, NULL),
    (10, 1, 2022, 25, 27),
    (10, 1, 2023, 23, 25),
    (10, 2, 2021, 24, NULL),
    (10, 2, 2022, 26, 24),
    (10, 2, 2023, 28, 26),
    (11, 1, 2021, 28, NULL),
    (11, 1, 2022, 27, 28),
    (11, 1, 2023, 23, 27),
    (11, 2, 2021, 24, NULL),
    (11, 2, 2022, 26, 24),
    (11, 2, 2023, 28, 26),
    (12, 1, 2021, 14, NULL),
    (12, 1, 2022, 13, 14),
    (12, 1, 2023, 11, 13),
    (12, 2, 2021, 13, NULL),
    (12, 2, 2022, 12, 13),
    (12, 2, 2023, 9, 12),
    (13, 1, 2021, 46, NULL),
    (13, 1, 2022, 47, 46),
    (13, 1, 2023, 43, 47),
    (13, 2, 2021, 25, NULL),
    (13, 2, 2022, 31, 25),
    (13, 2, 2023, 38, 31),
    (14, 1, 2021, 46, NULL),
    (14, 1, 2022, 47, 46),
    (14, 1, 2023, 43, 47),
    (14, 2, 2021, 25, NULL),
    (14, 2, 2022, 31, 25),
    (14, 2, 2023, 38, 31),
    (15, 1, 2021, 37, NULL),
    (15, 1, 2022, 31, 37),
    (15, 1, 2023, 30, 31),
    (15, 2, 2021, 35, NULL),
    (15, 2, 2022, 34, 35),
    (15, 2, 2023, 33, 34);


-- Questions of Interest:

-- 1. What are the top 5 ranked programs over the last 3 years?
GO
DROP VIEW IF EXISTS Top5RankedPrograms
GO
CREATE VIEW Top5RankedPrograms AS 
	SELECT TOP 5 p.programName 'Program Name', rs.rnkngSrcName 'Ranking Source', r.rankingYear 'Year', r.rankingPosition 'Rank'
	FROM [RankingScrutiny.Program] p
	JOIN [RankingScrutiny.Rank] r ON p.programId = r.programId
	JOIN [RankingScrutiny.RankingSource] rs ON r.rnkngSrcId = rs.rnkngSrcId
	WHERE r.rankingPosition IS NOT NULL AND r.rankingYear >= YEAR(GETDATE()) - 5
	ORDER BY r.rankingPosition;
GO

SELECT *
FROM Top5RankedPrograms;

-- 2. Which programs have shown the most significant improvement or decline in rankings over the last 5 years?
GO
DROP VIEW IF EXISTS Top5ImprovedDeclinedPrograms
GO
CREATE VIEW Top5ImprovedDeclinedPrograms AS
	SELECT TOP 5 p.programName 'Program Name', pt.prgTypeName 'Type',rs.rnkngSrcName 'Ranking Source', r.rankingPosition 'Current Year Rank', r.rankingPositionPrevYear 'Previous Year Rank', r.rankingYear 'Current Year'
	FROM [RankingScrutiny.Program] p
	JOIN [RankingScrutiny.Rank] r ON p.programId = r.programId
	JOIN [RankingScrutiny.ProgramType] pt ON p.prgCtgryId = pt.prgTypeId
	JOIN [RankingScrutiny.RankingSource] rs ON r.rnkngSrcId = rs.rnkngSrcId
	WHERE r.rankingYear >= YEAR(GETDATE()) - 3
	ORDER BY ABS(r.rankingPosition - r.rankingPositionPrevYear) DESC;
GO

SELECT * 
FROM Top5ImprovedDeclinedPrograms;


-- 3. Which programs maintain consistent rankings across all ranking sources?
GO
DROP VIEW IF EXISTS ConsistentRankingsPrograms
GO
CREATE VIEW ConsistentRankingsPrograms AS
	SELECT p.programName 'Program Name', AVG(r.rankingPosition) AS 'AverageRanking'
	FROM [RankingScrutiny.Program] p
	JOIN [RankingScrutiny.Rank] r ON p.programId = r.programId
	GROUP BY p.programId, p.programName
	HAVING COUNT(DISTINCT r.rnkngSrcId) = (SELECT COUNT(*) FROM [RankingScrutiny.RankingSource]);
GO

SELECT TOP 5 *
FROM ConsistentRankingsPrograms
ORDER BY AverageRanking

-- 4. What are the top 3 degrees in Smith School based on program rankings?
GO
DROP VIEW IF EXISTS Top3PerformingDegrees
GO
CREATE VIEW Top3PerformingDegrees AS
	SELECT TOP 3 p.programName 'Program Name', r.rankingPosition 'Rank', r.rankingYear 'Year'
	FROM [RankingScrutiny.Program] p
	JOIN [RankingScrutiny.Rank] r ON p.programId = r.programId
	WHERE r.rankingPosition IS NOT NULL
	ORDER BY r.rankingPosition ASC;
GO

SELECT * 
FROM Top3PerformingDegrees;

-- 5. What is the proportion of programs that either improved or declined in rankings over the last year?
GO
DROP VIEW IF EXISTS ProgramsImprovementStatus
GO
CREATE VIEW ProgramsImprovementStatus AS
	SELECT p.programId, p.programName, r.rankingYear, r.rankingPosition, r.rankingPositionPrevYear,
		CASE
			WHEN r.rankingPosition > r.rankingPositionPrevYear THEN 'Declined'
			WHEN r.rankingPosition < r.rankingPositionPrevYear THEN 'Improved'
			ELSE 'No Change'
		END AS ImprovementStatus
	FROM [RankingScrutiny.Program] p
	JOIN [RankingScrutiny.Rank] r ON p.programId = r.programId
	WHERE r.rankingYear = YEAR(GETDATE()) AND r.rankingPositionPrevYear IS NOT NULL;
GO

SELECT ImprovementStatus, COUNT(programId) AS ProgramCount, CAST(ROUND((COUNT(programId) * 100.0) / (SELECT COUNT(*) FROM ProgramsImprovementStatus), 2) AS decimal(18, 2)) AS Proportion
FROM ProgramsImprovementStatus
GROUP BY ImprovementStatus;