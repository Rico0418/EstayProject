CREATE DATABASE SoftwareEngineering
USE SoftwareEngineering
USE Estay
DROP DATABASE SoftwareEngineering
CREATE TABLE Users(
	UserId uniqueidentifier DEFAULT NEWID() PRIMARY KEY NOT NULL,
	UserName VARCHAR(50),
	UserEmail VARCHAR(100),
	UserPassword VARCHAR(10),
	UserPhoneNumber VARCHAR(13),
	UserAge INT
)

CREATE TABLE PaymentMethod(
	PaymentMethodId INT PRIMARY KEY,
	PaymentMethodType VARCHAR(10),
	PaymentMethodName VARCHAR(10)
)

CREATE TABLE City(
	CityId INT PRIMARY KEY,
	CityName VARCHAR(30)
)

CREATE TABLE HotelLocation(
	HotelLocationID INT PRIMARY KEY,
	HotelLocationName VARCHAR(50),
	CityId INT FOREIGN KEY REFERENCES City (CityId) NOT NULL
)

CREATE TABLE Room(
	RoomId INT PRIMARY KEY,
	RoomName VARCHAR(5),
	RoomNumber INT,
	RoomStatus VARCHAR(30),
	HotelId INT FOREIGN KEY REFERENCES Hotels(HotelId)
)
CREATE TABLE Hotels(
	HotelId INT PRIMARY KEY,
	HotelName VARCHAR(50),
	HotelType VARCHAR(10),
	HotelRating INT,
	HotelPrice INT,
	HotelImage VARCHAR(MAX),
	HotelDescription VARCHAR (255),
	HotelLocationId INT FOREIGN KEY REFERENCES HotelLocation(HotelLocationId)
)
CREATE TABLE Transactions(
	TransactionID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	TransactionDate DATE,
	TransactionStatus VARCHAR(10),
	TotalRoom INT,
	TotalPrice INT,
	TotalStay INT,
	UserId uniqueidentifier FOREIGN KEY REFERENCES Users (UserId) NOT NULL,
	PaymentMethodId INT FOREIGN KEY REFERENCES PaymentMethod(PaymentMethodId) NOT NULL,
	HotelId INT FOREIGN KEY REFERENCES Hotels(HotelId) NOT NULL
)

/* dummy data */
INSERT INTO Users (UserId, UserName, UserEmail, UserPassword, UserPhoneNumber, UserAge)
VALUES 
(NEWID(), 'John', 'John@asd.com', 'John123', '081517889235', '17'),
(NEWID(), 'Clarissa', 'Clarissa@asd.com', 'Clar1634', '081527484235',  '19'),
(NEWID(), 'Bob', 'Bob@asd.com', 'Bob9827', '081556789012',  '17'),
(NEWID(), 'Wick', 'Wick@asd.com', 'Wick9872', '081556789012',  '50'),
(NEWID(), 'Steven', 'Steven@asd.com', 'Steven987', '081556789012',  '18');

INSERT INTO City(CityId, CityName)
VALUES 
(1, 'Jakarta'),
(2, 'Bekasi'),
(3, 'Bogor');

INSERT INTO HotelLocation(HotelLocationId , HotelLocationName, CityId)
VALUES
(1, 'Bekasi Barat', 2),
(2, 'Bekasi Timur', 2),
(3, 'Bogor Tengah', 3),
(4, 'Jakarta Barat', 1),
(5, 'Jakarta Timur' , 1);

DELETE FROM HotelLocation
INSERT INTO PaymentMethod (PaymentMethodId, PaymentMethodType, PaymentMethodName)
VALUES 
(1, 'E-wallet', 'Gopay'),
(2, 'E-wallet', 'OVO'),
(3, 'Kredit', 'Kredit BCA'),
(4, 'CC', 'BCA'),
(5, 'Kredit', 'Kredit BNI');

INSERT INTO Hotels(HotelId, HotelName, HotelType, HotelRating, HotelPrice, HotelImage, HotelDescription, HotelLocationId) VALUES
(1, 'Hotel OYO', 'Motel', 3, 150000,'https://images.oyoroomscdn.com/uploads/hotel_image/107543/2840278017c06018.jpg','Hotel pilihan bagi anda yang suka solo travelling dan ingin menginap dengan harga yang murah. Fasilitas kamar kami dilengkapi dengan kamar mandi, tv dan ac' , 1),
(2, 'Hotel Aston', 'City', 4, 300000,'https://cf.bstatic.com/xdata/images/hotel/max1024x768/17022539.jpg?k=06687450b0ff4e35d4b0b70e6d3cbaf07f0316ae3b9305a12fedb07a6e49715c&o=&hp=1','WE ARE THE BEST-KNOWN AND MOST TRUSTED HOTEL BRAND ACROSS THE ARCHIPELAGO, HAVING WELCOMED AND PASSIONATELY SERVED MILLIONS OF DOMESTIC AND OVERSEAS GUESTS EVERY MONTH FOR MORE THAN TWO DECADES.' , 2),
(3, 'Hotel SwissBellin', 'City', 2, 100000,'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxITEhUTExMVFhUXGBcYGBcYFhggHRkYGBoaGBoYGhgYHSggGxolGxgXITEhJSkrLi4uFx8zODMtNygtLisBCgoKDg0OGhAQGy0lHyUtLS0tLS0tLS0tLS0tLSstKy0tLS0tLS0tLS0tLS0tLS0tLS0vLS0tLS0rLS0tLS0tLv/AABEIALwBDAMBIgACEQEDEQH/xAAcAAACAwEBAQEAAAAAAAAAAAAEBQIDBgEABwj/xABGEAABAgQDBQYDBAYJAwUAAAABAhEAAxIhBDFBBVFhcYEGEyIykaGxwdEUYpLwFSNCUnLhBxYzQ1RzgqLxNFOyJCU1wtL/xAAYAQEBAQEBAAAAAAAAAAAAAAABAAIDBP/EACwRAAICAgIBAwIEBwAAAAAAAAABAhEDEiExQQQyYVFxExSh4SIzQoGR0fH/2gAMAwEAAhEDEQA/APrjx54i8deOhkkI9HAY68FkdBjxMcj0RHo5Ho9CDPRAxImIxAcJgDbm1U4aRMnqBIlpKiBmW0DwcYzf9Iv/AMdif8swrsV2ZtP9LLs2CnFw4bUbxvji/wClsBRScHNCgSkgkOFAsQQ+b2aMlgO1EmXJqCWniwLlx/CGZ7WW9gcnAITbITJUwmTEIJKncC2uZtrblGoK72jR7fV4cOLV457Wr8fv+vPwfSFf0sMHOCnNvtpxjfbI2knESJc9IITMSFgHNiHvH50xGIQQod4XIOVTE8fE2fCPuPYVf/t2E/yJf/iI1OCStHivhmhXiL0pSpamelAGW8lRCR1LmISMalSihlJWliULDKAORs4UHs4JEApxFWIXKTSGTUVFw9kkpdN3CVIzGnAtCVNC8QkoUhYlpWVLlqKgAsMlBVvJZTXsjlHk3ex6lji4vjxdjiqPVRnjhptvDYBv+pmb33F9c+GmU04WYCGSSGe+ImG7mzHMZa7+vejyWPwqB8ftBElNSzyG/wBeY9RCYYWazBGYY/8AqZtsjYkZuM823O0B9o8GoiWkHwgBJqJU7FyCo3Jyvr7R5vV5XixOS/58k2OsHt6WtVLUl2zBuwLHcWI9RDWqPkOyZg+1jDppTMICSe6ISQhJmKFVZJ8ItbMR9WSuwu7h3v8AOOfpJ5ZfzPhp1Virqwh468D95He9j10Re8eeKguOFcVCWvHCqK+8iJXFRWWVR2qKao5VFRWWlUcqiFUcqioi1488U1x0LhAvePPFIXHaoiLXjxMVgx54iLHjjxB45VERN488QqjhMQEiYqnykrSUrSFJIYgixHGOlUcJiITHspgP8JI/AIj/AFUwH+EkfgEOSYi8Ni5S+onPZXA/4SR+AQ1loCQEpAAADAaCOkxUuYASVEAMLktv1MJltvsjiMTKSSmZRdJUQpILpTcm4yBMSws9CpaTLAEsh0hKQkX+6AGMZ3bykLnyhWkpKFpUQoWDhWYdj4W6xXhNpLTIRLAT5Lm9qhVoQx8RHSM8bHWUKxp33+5qiqOCel6ag7Ozh9NOo9RGdxWPmKR5kA1JIyHlJNquKQb6KAzeAMbOWb1kkvVSbeUBrFtPhGrONGyMwZOH5iPLAIYgEcYxMjbKZKgJlWRuA/mAAz0BS7cmeDB23kl3lzUi7EUvZtxtmfSClJck+HRXisbs2TNTiJaULxBX4WWp3UDLJYlvKSHbWHeD2+ZkxMvuiCXvUGDAncN0fPcNiUOxWCVOVBISA7FiqlINjlzh0nGpBBRNSlQ1e8Fmjf1R6qMrsPa7zFCZiE002dYAdxvPONJLmpUApJBByIIIPUQ9kXhUdqimqPVQEWVx6qK6o9VERZVHgqK6o9VEJbVHnip488QkRNiQmwtE8R37RG9TnYzE2O97Cv7THRiYtSsaiZHe8hWMRHRiYNS2GlUeKoWfaY99qi1ZbDGqPVQvGJjv2mLVlsHExwqgL7THvtUWrHZHsbjjL/upi+KEk9LOfaM/N7cSgWEuYS7XChfLVIjQHGAZkDqIz+zMWES58pQN5k4ptZQmLUoFyBvgorIL7UzSCpMpYSNWS3J3zhB/XGZiUEjDrUgEO6kgAghnYHUiCpYV3aksq5BZjCvZSGTNFKxUzAoUP2knUbh7QFYbKxWJWEqRhkso0pKpuZvbMNkYhNnYyhK+7kJStVINyXcjfl4TeDcHNCUISQpwuo+FWXi4cYhNmPLQllOldR8JydR3cYqRWxdtFWOlKCTMlglIUKEpNi7XIztBOxe/UFrmzagGSEsBc3e2los2qvvFgpSpgkDynefrE9mJISsEEXBuDA+xAttDxJ5H5QvULQx235kcj8RC5WUAnOzeyu+mr/WoSQD4TmzpD8r+0GbQwndrKK0qILOHbIF/f2hf2YxKUYiYpRt3dNhr3gPwg/HTQqYpQyLN6QhyDLTyj6R2dTThZI+4/wCIlXzj5ys2j6Psj/p5P+Wj/wARDEWMKo9VFNUdeNUBcDHniqqPVRki6qPVRTVHqoiLqo9VFTx54hMuNqpzKg0VzdvISW8WWkZdKXYHLVvzvjgpyA949FI8zbNdK2qlW/hFpxyRm8ZATSDZ/hESocYKLY136VRVS7b+EeG2pWjnfkPnGRRNu1jpeCFy6UkKZ9Lac4hXKNJL2yksKVVEZDVs2vz9InN2q16SRxIH13+0ZMLYg+nvF0rGrskKcvq1/WArNMNpqz7tXO/0iJ2xuQYTzp605lP7OTFjq6SL/COfb5j3Wg8A+X7z5f8AEFo01Q8l7TJLFNPF9N7ZxerHJH7Q6GM7PWSxSRbQJDKvvJivDLLnvEhINwacsmFuEQ14O9tSpVKkrUkhJ8qlDjo2+ApdZlo/WLdxcTFubal7wfiJvjlkEKAJ3sQUiyhziSJ+TpB84y1dwbvkA0cpdm10CTMXMS6KlsoKNVa3SUgEAF7ZwenFqrQXLUqBFSmLEAEh7mxvxMBKxIDpKXUoFjYAUpBLgXLv0gmqXUjzBwQTd3tl4srH2gJkPtKqECpThdzWp1CvI3yYt0i+djaJi1FykIBCaizglz1aByJdHmU9dxdkivzeUvoWiapKCspM1IqSGKiGV5iQHAuwJ9YbB/c4nFK7lYqVX42VVeyrWbdEcZjiwQKkkAEqqd2sQzalj0jow/6pS6rOuzBxcg5K3+0ex2DUlIWogAhnZWofIPug4FJi4zlEuVE8zEVKLZxwKR++Pwr+kcXNlgeY/hPzgNlnZTESu9mJXKCiEpLk5uohmA+77wRtGYO8UEgJSDYDTrAfZ3Zy1qXMQQxAAJtYFWj7yYJxKAFGokqcuw+pEadUYV2yhazvjc4PGhMqWDohA/2iMQqn734R/wDqHS5qqQkVMwBy3cCdIYFI0R2iPyYkMfw94y/21OSlUtoS5i6VPSWNTHRTDi/HdG+DPJozj+EeTj3LMYzYmKPiKilswHL872iMraCEGpS6WJdJbWzs9/5RUiTNL+kw7APyI+scG107iLtpGcO15aE1jxbmuHawJGWbwv8A0rSSJjpUGdLEu97esCoW6Nr+lEnIRAbV3pj5xjtsTVHwEpToAWPXWBTtSf8A9xX4jDSDceKkWsknkL+hDxUjZk4hwgjmQD6EvGdwm3ZiBYvqH+JbPrui1O2ZzPp/Cn6Q7GFT7HX2Sa9AS55i/vHJuCmJDqATzPtAOH2vNdKikKAGRpD2JBLC3PO0cxXaWYyk0S0uzFKSGbdBuy1iGypBL3Ta5c/DfFy8Osh6gw4n0EI5G1JhILpN8ikNmLPEcViSt6jd2sQw5DlrA5ioqh0lKiKgHSM/lEkSlkgiS40ZRHV3jM4ScQpwSALlt3HhBsnbc2pIZ7UhIqu7/ul3vpA22d8cscY8xt35NKrvFghUi5OdXL6e8VnDLF+7APEv87xRjMW/hpZLA0Ek07y5uS5sDCKdhlKzUOiW+EZ/udtr6xr9f9jGftlAyBtue5y1y9IjK2ukhiSCxcadDr6Qmx+EKEpINQUA/BWqfpAgCrZlywGZ4W3xo8s22+qNbsva7KCEZkuTcMwJYDjDf7WoNUAfEpNwLubaaZZxldg4WamamYUGkO7h7EHNsgeLRrE0EgFJ8yrp4OQwsLRl9lHhAysbL/bloKy9DOHsKr3psYMAlEosQSHHiSwysSWvc+hhfRKUQpRpUPICXJcMpsshzgv7OvwEXs6SDcgDO7b98Bo6vCIUhwsgKUUglB81TN6gxybs4qmIIWnwOSAbl0TE5Fm8/tA09CqFeYXtnbxu4OWu/SLdmLmAg1VKpLlXitWsgPfLwwASVgZgCnTnXxzNmaKMZLIll0tdRy0bURUnGLTVJSyUkTVVBwoEKsxByvuhnhsUVomAjIEXLvpqPrEJmXiublFqZ6mdx+FG7gI5NnzG86hyJHwiEU4OQpa100nwgF97rYcvFGhlINKRqEpFuAAhbg+0ipCVDu0rISFOpSruoi/r7Q4m4hS7kkPdnsHu3vDYKjyZKv3T6GFEvGz/AC1AgPZQfoQbgwyLZmM5MmqWQwzZm19ILoJBq5sw5kM+QAtz3REYg51kX0P/ABEJyylkKCqm1tfWIo2dNbyjqpP1iszTLEKmhToWt9CFF78fWDEypPmmGctZzFDDnVU5j2C2AqYADiZEvUgrU/pSxPWC14CTKZS8YlZt4AhYqY5BV25tDs/qVMLwM+QQAJiJR/dUkhtMwGgleERMFImSZn8JJY9BGbxmMw5v3QJH3lD4N+XiqRtGU/gStHhLLSSSDx1bK7w2KNEvY+HDgqDuzh+uZt1hRiNnoqNM8EbyD8kkQAZM5JCiFsbuUqDvxIiufOpLGYE8PHb0SYm2D58ESlAySH3t8AfifaOgQAvEq3bnN2H84pmY1RLu278iNb/BmhxLfSJqlS15tVvZgYG2XtexStCF28JKci9qiCHTnm5i47SIKvDJubeEEdHeLdFqSw+HQCXDFiHa9xokm+Y3We8VYxCkLpN2pcpzuxvxHHIwJiJi1KfLkQA3ART3hDuSOof2jlKVs10bDZErBqKiiWpZGZmXd/uptpqBBg2dJrStMoJWD4VAKSAdPD5Yw+DxxCkkOMgXZjfV7Q5XtsgVd6QbikDK7gu40a0Fs3Fqg7FqlpDl9bE3J3n5wsmTiS+W4CBtq47vL2uLlOuefXSPYDa3dylAly4pFn3k3GXzjWyHca4aakpKVoUKhml73BAbc4015QwVgGZUuWktkWIJYb6c+JhBh+0RSqsHxCwDCz8W5xd/W+aRcF/4vpE2maU6dhfZ/GzKppqUnxyvwmuzHT6RohjRUApIarMWZ7A25tCPZG2FTgfC1Hd3e6nKnqLXv7GHboJuKfE7jIWt4WOrafCIwDjDSZhSupaDLJICmY1Ap0uRr6QSrBroSZZew8SDyyIvpAC9m94ULSr+zVWXDG4Ui7lgPFv0ygiUpSabmoZAvZxdgeWkREps9aEH7q6gCNanuc2POLvtCFL8aAQoJsALG93N9N8Vq2ipIZQCmUfNe1Vw28DK8XonSZismsCCSzm9mUcxfKIgIzZNKgVETP1n6sE3D3apxlfODpWGoQs1AhQzAHF3YmA1bIQtXey11FpgDgjzWa+4hoIRhVI70kM8tI6grJ+IiIz6MMGur0Sfm0SmSUsbq/CB/wDaJS4smSVkWSr0MQg+ysDhilapk6UnIETO7JSMwC+mR6iDZtAJABLa1AegAyhDK2CuaZh8SakhPkfKi4LsfIfWH0ySQbsNbqTrwd4mSKpswAE0hmOZV8iIyUvaFKKQVC7uLdOX0jVYtI7tbrA8KtFbj92MHMDAEvTcPxGdoOwYbNxwJ8RUTxPvHZeKIPhI4wqVOJbSOy1F7OTFQcmq2ZtJIJTNJbeA/Qj5wFjsRUpRBqGjgC31imXgVFIKXdwCCGsxcvuyDcYhM2fOH7B3WvnlFQvZkDOv+7y+kOey3dKXRPCghThKwQKVMDcZFJbUboBPZ/FsHkFuCkn2CoonbMng3lLAycggc7w9GeUfUcd2loJTh1umWhmJJJU4SCSq6hf24xLG9qyFMMPUwDm2bOWcZR8uwxIUEqd8nfTdbPKJz2CiKibm5HyJeLsdjszZKybrA5OfkInJ2C+c1rf9v380aSTggsliCzZBWvMCKsZLCKr3DWAU7nJ9BloTHorGjz1kozWLwfclgoKycgEdGPxgNc4uzev1juKxKip1C43N8opCyTcng0eeVXwdop0Wd4rPjaKps3lEZgtFBV4rCM0ISCc7R3vwDdyLAPxgZSmufW8VKmPyhoqGkzFabvhFKZ4z10geWtxleOAtBqVBMxwxORy4xcJgKchZgDuD87/zjmHl1JCUqBU7UtfxDO2afgYYT+z+IB8ElZHAOPV8ucRot2CvFFR+zVleZCWII+8DZs7nfpG0wuKqSO+l0qtVQQWU13SCQ2dxGe7O7KxUusqQZZIDKqS7hQtYvk8atU0KLLZWbKT5sy3OzRpCAztmFZlLlLCkoUFFsyGWGIzHmB1ygmTOISkKAIS4pLC1Ott++IHALVeWSkiyf2TfcrfHMPjlh0YhJUpIzKaV2FyGsfzeIiSxKKWJKVFTBOYaoB77nD3EeXgik0tUAH8N7XGRu3J4sGFRMYy1AkXpVZQci245RbKdM3VDjIgB8+hvziAWrHgWkks8x0v1Hh5iKJW056xMQoUhC1JBAIdILAEKcHmGhqVj7Op0hRFbE/xG3JrWaObTkS0oSQtTHRnb1It1MTIUiar95XJy3oLRTOTYkwQCjcs9Qn6xGbNDFkJ6lR+BA9oEIqkbXxqa0SlKCUhFLS0nOh70knMw2XmeZijC7ZwksFKpSyt01ABNLqpDh1cd0GLnqezD+FIHuA8TJAeMkqVKWEpJdKsgTod0ZPGYNBSkSxMdySFUEB9QpJc8qesa7aEwmWp1E21J+cIBCq8kxPh9n3deW5L56ZtDvAJRSSmkUs4sDTqoalrWDm/CGGyJKUgzFByXSncH/aPuByPCCMXi0yLoEp1XcodW6xJBMD7NQaQEqekFgoK4g29TBGHXq7wKhYcEISDqQQC2tg189DEDgjMLqMsDdUXfiwBbhrEdN6G+Hw6pnkJDECymzfIEs/C0TxonSh/azCXAUCkMl7gFVar8OMUbIJAUFqTmNRffY6Xi/EY2TLUEKBCyMkpcEPqAG0jLJSsVYwd6QpSUkgAOlOguxAtqYvw+yEFIPczC+tSr9AmDpm1kJQoJBdn8ic2yvGfmbaU70i++Kwko+TQzNpJrSZBQx84UpNxdmDlQLl3YiBsRi1KrqKAoh/DXkDY+JIHvGfwM2d45lPleohgyc3LvuOUQViTPSXdhmpiWAv8AvN0aNtpHG+CidglJcKZ7sX97QnTiCHH5eGEjE2DKZI0cZcLEvEZMmWUVUqK3uCPDz55bxBYdAZUW94b9nuymKxYMyWkJR++twknclgSo8rcXiiTJUVpUmWFU3pUAUncFAm6S2XOPtuycemfJTMSmlwxR+4Rmm2g+DRIUfMZXYMmy8QkcEyyel1D4Qww/9HkjVeIXyCQPdJ+MfRCGv68eP19YsSvjCaSMZh+wuHH9wSbXXMVpwCvlDWV2WlJv3UhP+gEjqRGgLan1MV/aZY1HS/wiGgKXsoANWw3JSBFidnS9a1dW+kWqxyRkFHp9YqVjC9k9Sf5RAdOEljJA63iJtkAOkQViFncOQ+sVGrUn88vzeEi48yPSBZqJZBSoJUkuWN7kuSNxfWIlI3u3WK5k5CQXNhfp1gAXT9m592bFhSpzkdFAP6g84hhcdMCGWKmLUzB8zn7xdidsSkP4g4uGct6QHhu0aFrUlaXD+YBiH+6Tlf8AlEQfNXKIKKjLKnsbpcnfpccIjtSUugeFwNUlwX9xHpuCTMFSFBXy1Zjcfm0DiQqXLWFO1Upg5bzF23Pb0gsqAQLtF/6OmqFkK5kED3hliceUN3SjfMLDlOTMrXPV8oFXtLEHOYW0AAHwaIUC4Psi9S5oS5KSDUpmQEtkQPMDBOJkJRkpK/4Vj3DExR4iHKlKL6mK8Emctc1BH6tIR3fFw62POn0isqKNrTD3K2SnJrgnPmWeMUvaLMkAFI3jrH0kbGVMBSsMk2Nw/wCXaE+0/wCjk+aTMf7quTWOfHMmMuKfYME2Ht5IlhM6WVsbEMwB0YnTLpBfaJOGoMxJNVQSBoCwJTwsX5xmcTsydhWE1ITUTkqxZntYjPURVOxtb3UblSr5nU3zguuDKbQcrEhKXziB2k6rgN14XzgILCgwBDWzcW5xSQgBrg8x7/nSBsdmNpigoEBQa+f8ofpWlUhJUoBSUgVM9xbq9rcYy0mYAgsTSfNcX4NxiK5pCKAqyuO643sYlJjs1yFnaCXIBfMOAX5sTAcwF7Uto9uOUAyR4rbnzvBKJlvFnyB+UXJlyb7NTKl4Vgi5J89JVudndmv+TDLDdn8Onyyh1JPxLQnwezBPCqVoQEB1BIP3gztd7aw6Vi1SpqZZWVAAJcBkl2Z3L9bw9HWvJcNny03TLSOSB8hA2JlpUkikmxsQB8YNTMq43gDbGLEpLhJUS9gWsM/jHNT+pqUUkI5ylyBWEA1gZ6Nb3eHnYvbYS5W6UkGsG4qCgAQ3A/KBNlT5jETJbJFwRe29UKe06UzCkA2QXsk+bXLh8I7xTOTaPr89TJcHPI/OAAg3Dn1jKbK2xNVKSkLuhgXAdiePH8s0LNhY6fOE3vZy1FMwpza25ksN8Zc0rOkYXXybqYUJupSU8SQOMCzNqyE/3gP8IJ46QhTg05teJCSPyI5PN9DqsH1Yyn9opY8suYroAPcxHCbdK0qUZdIS37TkuW3DhCyakNHsEpJlTKSDa7F7hQtbWNQyORnJjUVwHz9uKpJCdWuQNx05wDP2zMJIdIy0vrqYV4+aAk2bW54DeeEKMRj0JJ/WJy0c79wjpZwNQnbaVBYWFAszXG/lC/aKgpZCcmu5uzK1H1jOTtrodTBRfkP5wKdrrJZKQ5sMyenrGzPNmk2mUpJAPp15wPs2YAur71/aEkxOKmkVFTqsHs7aMBdoZbP2euSaZuZIJu7C2e6AUamQshlAlJ0I3NBuMxq1S6VAE1DxC3lvcb/SFeCVYPbT2gu5c6lyfiYBLgorIcpHE2fLoIMl7Ima2G//AJtC5KmPQ+4IiqYo+VywyG7W0AjlUmSgMpaXfeT7JEQO0ZSPIlT8gPe5hTMu0cKWzhIYz9tTP2QlJ3s597Qvn42arzTFHg9vQWjltTEFkaP+W/PWAjN9qVB5Y4K+WsZ9KlZZQ87VjxItkn4n+UIHYmrN2L8LNBRlhcqeo6nUxStnFOunW3yitBa4tnrrFklTkNv10J/J9oGjLQXKRSKVCxLuPqNYjOpdgSGDX94mia1n4EHKOYqWktdtxBt1H0jPkgQKJNg7RcMJMPlSw3GDcNOCfCAOb29TFn2yH7DQ3ky5qnTLlqY2ZIN23wwGwsWUodBQkEuV6PlvPx0j6EvaEtFq0DgCPgIA2jt+RQpLkls7AAi4eogtbdHRwT7Om3gzWFmEqUhbVJsePHlugqfhULDLSFDiIWYvFD7QlSCaVFNQuA5FN7MRkXh1KQQHJA32f3tHDy0jSdoyW3p0wTxJQvu0BDgBCTkMg4Lc9GjUYTCyJspMxKC3lNRJ8Q1FzZyRvyhR2swwqQs7iknVhcZcavQRZ2UxyZcxUlZZK7gmwCg59025gRv8SmkYpWMNr7PpAmyk+KXmAPMjMjmMxyjGYDbKJC57grrXUALN5s6uYjf4va8kEIC0qUS1nI9QG94QY3ZeClrK1S0gqL+NTBzeyVlm6RulJDbg0IJ/bBeSJaQ+8kn0DRSvFbQm5BYHBASPxKb4w6mbYw8sFKCkDdKRY87IHVzC2d2iLWQonepQ+AD/AO6FY4rwTySfkCTsLETbzJgG8KUpRHQW948rZWIw7iRMUoLDLpDB3Zjdhzd45N2tOJcFKdLJf3W594FmonTrVKUzqLkkhOpCXc8QN8NGbZyZs5VzNmy0kb11Hl4X9yIslYGQxPeLmAapASHZ2c1HLgIrkypLOBWQS4sHSGcpUTmbAC5PSCpWzwFKCU1IOgJzIzBI0yuL3gsqZGSmUUrVLlJUpADhVSncsSxLWYnKADtCcWQldN2ASyc7aMDDoYJiH7tJZPqM/LSCDdwRr1izD9n0EhWetmb2jEskV2bjjcnSAthTyCFhwoKDne9QvvjcSVS5zCZmBbKkvuOl9HhNJ2IgBqW1tm+94kpKpKaVXQzBbWFyfENMxGY5YyfBqeKUeWO52zUhLpISQWKSbP8AdKvnA4dNmv4s9xAH1hhgsXSAC6kl2u/Fr9YZKly5o8WoDG1urOOto6GEjPrSzjNifQPFE1Tn0HoAPlDbFbOXLc+ZPivzBDkQpWbnnEBOZOVpbl9YrPExNEla/Kknp88oM/R6iXUUJ4JuzcB9YgF5iNJOUNkYSWNFK5lvYfWLSukPZA4MPUw0FmQ2vs9QmBS0sKQwILvUwNwzOre9omtMtfmShWVlIQc9fEP5xqJ0yWpNK/EDv+IJueaXjPq2XKCvMspuyQRYMc1KF/whnzg6NUCzdlSCB+qQTewBSfwhQG+Bp2wZQ8RCkDfXa+XhWCc9zw+K0oACAABzJH+pTkesI9rYuuwu7ufr+dIm0DVCLGYYJUaSFAa2H5y6wKucD7WvpBWJW4ZnHvz5898DKwoN+g/OUEVYLkmJvFuEQM0jI+sTkyCm5u/DKIzQCdPf5RdMPJ9GnywkgF1ODYm1uGWojkxNSClKQAQRbjaFmPxE/vigqcAhmDMCxzEalGFGbQxg/LOkpq+EYeUDUpCiEkPZyWI37vyY0sjbUsIqWsBxe93ZjbnFeP7PVzisEJBY5F3Zjq2/1iqdsiVhkqmKYkXcgOX4tbo0cddZMFfZVtfaqJyUCWlayFO4SW9fznC44KatqglAG9Qd+nWJK7QE/wBnLsL3c8+j/GGezpWLxCSRLmM5sEkJ9Wb3iat9EmmxHipgyqBIbW/NoVLS/Ek9TnG7m7GmS6RMQBU7XdiGd21vExslDeXpkPSJTjj7PQ4zy0YEYdR0bn9M4ul7NWrJKj/pt6qb4RuZWzkjypSOIA+MVz58mWPHMSOt/QRL1F+1B+Xr3OjMSdgrPmYcyT8Gg2TsMC5ckXDAC/Bh7wRN7RSRZCVr6MPeILxWNXdEoS0nVTD0KyBHRY/US5ql8mHkwR4u38FkxOGlLYJqSU5NdL21yUCI8nacqhIUpLAljeoA/s0te+rwvxOzsSSVTKllrsUkAf6SWEBLT3fiKSG3hmPXnaGWGvc7+xx/NP8ApX+UTx8xC1qKSQDw4DR4Lw2LXSEpVSls2HxgTCuZksk2Kg++9h8uhjq5BKigJs7er5gXeBaRdHJzyN2u2H4fFrlKqqrScwSSebmNLhlImJdLEHMfIiEuyez4uVLtdgkF2y/aGUdKzKmlMhBtmSCSScnDs3KOeZ4pxte746PZ6f8AGx+9XH9RkvCmUHlg0irwgn9rmd7WieP2sqWmWU0gKQovckFCRVZxqcuEMZMxKgDva24loWbf2cqZL8AuhyAMyCzsN9vaMY8nH8R0y4u9QvGbbVLQhXmenyu182fIQtwW3ZSj45aUrKs8wzWPisk6ZadIXYfDTi4K0s/8XMMlwDwJEeTs2Uggqdb/ALyiAH+6gv8A7jHa3Z5OWzVYiaQRUtIScgSx5DRXSB52MAyB4VeEejVDnS0IsftIDwJNJYCwawycjPrCtG12BZiRbjbh6RpzF0jUfbKn8TNmABzZy7jiGgSbiU1BiAWPE/iLqbg8IJm0VkOBnobcGaAl4taiwAqY3zt7NujG4brwaGbj073Z3tAOJ2wkaEjeMvWE6ZyXcMkmxca5+kXKIDsWuzOW53gcmDkwqbjVKSdBr/MtAndkkliBwI9r5x5Ex3ca2JzcZ78rZ7ok7sQATvZ8vraC3Zh2+ylRSkADWz5gE5X0jsySCWdtXb1cZboIBBuWBNshf0eIhKnsRUwO/nc6RWZ6AypV7OAW4vv+Ec737h4sIY+VD3d893Rs758I6VjVzxdvgYnK+zVtj7tMkS5gmFy9KaUlr+K5LZeEDrBEna8xSE3awyA3bzF/auU8gqJNqbaPWm54sT6mE2y5VXhJLR6E/JuSrgd4DEKJNyTbMvvi/aE+lN0KXVZgCeekdwGHSm4EGT1UpJGgeOMuZHSPtMZhe6M0I7qgKLE1HiQGy+EfSNh7XQoJw9X6xIAu9wEuC+TUjfmI+ZY7as2pqmzuAPzpENu4tcpZUk3KQS+ri45aRKLuy2pUb3b+0FSyrvQruz5XSAQt2FKgSCgucy4jG43b84pKAEhBS1d3L21PMRz9ITp+D7+dMVMJNAQW7tIKTcIAAKrWKnbMMbxmlLLHgMuoDQuMW7aCU5RVJ8GhIXMDzcQUpDABNydMgQPfpEpGEwyVNQpZ3rUWyfJLH3hGiafF0Pw9rwQucalC1jbhkPnGlmlFUuDg0n2OVbUoV4EgJbKWlIu+qrE24mKsTtJJs97eoL/KFUskqZz/AMR1F6sgySQ2bnjHOWVmtq4SHg2sk+EueDQDisQsKSUktcJycC9viwhTh1khSjnk/Ai/wjkrEKWCSfKA3BgfoPSK2ytsN+0pUwYJALAixfRyAHPO8G4DCgkl1Kc3IUQX6ggwoxo8ytfCetj8Yt2XiliaEVEpKXbcWBs3OFG4mulpyCZikUW8oNuYKfhHZuHUZj9+AnNgnxEgWtk3WFyVkkvoYji5pA00jDxw7o6vI0h2rFIlIbPipWZ05DgXhNtHaxYByQ7upiC2gTkOjQsrJDud8LsU62cnwkAAHQtEmq4OcsjY2xG3CAOLuWLQuVi11KKlJpdx+esUypAdunTdEkoCSW0UoDluvFtwc9mSTOqFwUkmzvvGUVGX4goGk3yax3lrPBBSHFhkfhHUq8L2zLjQ84zYURE0GygwBa437x79IlIkXdK0s7l7C53s8V4tACglgzFXUR2WphYDdF9iLMThabXIOti9nLvfhAinIFh7gasdx0LmGcqebCzbiIli5hpByY6RJnRMXUk3tqDaxtm+RiSgRlncObWy0OgER78lB/iI+cGYKUFKoVcMDfk/yjT4N0imWks1JBzysHe9R3wb+iZ6kp7u93vr6aDflaCNmyEkmoVB8jlcA5RfMxRakBKRcAAWAEcnN3wc0r5M/iQuWpiQ6cwlYUGG9rc459uosZSVPdzx0ichNS1A5Ajq413wqxmKUFkA5R2pPg10f//Z','Swiss Belinn Kemayoran adalah hotel internasional bintang tiga di jantung perdagangan dan industri daerah Kemayoran, sub distrik Jakarta Pusat.  Hotel ini memiliki akses mudah ke Bandara Internasional Jakarta, Soekarno-Hatta dan Lapangan golf Springhill. ' , 3),
(4, 'Hotel Aryaduta', 'Motel', 5, 400000,'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/10/4b/b5/e7/courtyard-pool.jpg?w=700&h=-1&s=1','Berdiri megah di pusat bisnis ibu kota, Hotel Aryaduta Jakarta menjadi salah satu hotel siap memberikan pengalaman menginap terbaik di Kota Jakarta. ' , 4),
(5, 'Hotel Daima', 'City', 4, 350000,'https://cf.bstatic.com/xdata/images/hotel/max1024x768/251807769.jpg?k=948aef79c24663c1577b85e91e70f2bcdb74fad41b46a4b7c02f312aa4350ff1&o=&hp=1','Become a working partner to investors by developing other resources and potentials to get a maximum income  Prioritizing local culture in every activity that occurs in each hotel' , 5);

INSERT INTO Room (RoomId, RoomName, RoomNumber, RoomStatus, HotelId) VALUES
(1, 'A',101,'Occupied',1),
(2, 'A',103,'Available',1),
(3, 'A',105,'Available',1),
(4, 'A',107,'Available',1),
(5, 'B',102,'Available',1),
(6, 'B',104,'Available',1),
(7, 'B',106,'Available',1),
(8, 'B',108,'Available',1),

(9, 'A',101,'Occupied',2),
(10, 'A',103,'Available',2),
(11, 'A',105,'Available',2),
(12, 'A',107,'Available',2),
(13, 'B',102,'Available',2),
(14, 'B',104,'Available',2),
(15, 'B',106,'Available',2),
(16, 'B',108,'Available',2),

(17, 'A',101,'Occupied',3),
(18, 'A',103,'Available',3),
(19, 'A',105,'Available',3),
(20, 'A',107,'Available',3),
(21, 'B',102,'Available',3),
(22, 'B',104,'Available',3),
(23, 'B',106,'Available',3),
(24, 'B',108,'Available',3),

(25, 'A',101,'Occupied',4),
(26, 'A',103,'Available',4),
(27, 'A',105,'Available',4),
(28, 'A',107,'Available',4),
(29, 'B',102,'Available',4),
(30, 'B',104,'Available',4),
(31, 'B',106,'Available',4),
(32, 'B',108,'Available',4),

(33, 'A',101,'Occupied',5),
(34, 'A',103,'Available',5),
(35, 'A',105,'Available',5),
(36, 'A',107,'Available',5),
(37, 'B',102,'Available',5),
(38, 'B',104,'Available',5),
(39, 'B',106,'Available',5),
(40, 'B',108,'Available',5);

INSERT INTO Transactions (TransactionDate, TransactionStatus, TotalRoom, TotalPrice, TotalStay, UserId, PaymentMethodId, HotelId)
VALUES
(
	'2024-01-25','Done',1,(SELECT HotelPrice FROM Hotels WHERE HotelId=4),2, (SELECT UserId FROM Users WHERE UserName='John'), 3,
	(SELECT HotelId FROM Hotels WHERE HotelId = 4)
);

SELECT * FROM Users
SELECT * FROM PaymentMethod
SELECT * FROM Transactions
SELECT * FROM Hotels
SELECT * FROM Room
SELECT * FROM HotelLocation
SELECT * FROM City