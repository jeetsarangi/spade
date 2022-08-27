# SPADE(Spare Parts Advertising and Demand Engine)
### It includes code for website of car spare part company for demanding and forcasting for available spare parts.
##### Only The user module is present.

### Utilities :
1)User data management<br>
3)Cart Management<br>
4)Orders Management<br>
5)Product data management<br>


## To Run the system
1)Install the Oracle Database
2)Create Tables `User`(ID,Name,Email,Phone,Valid),`Cart`(UserID,ProductID,QTY),`Product`(ProductID,Price,Stock,Description) and `Orders`(ProductID,UserID,QTY,Total_Price)
3)Update the Database user password in connection object creation in all jsp and servlet files.



