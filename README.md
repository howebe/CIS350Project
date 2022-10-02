# CIS350Project
Project repository for textbook sharing webapp used for student to student interaction. 
*trying again*

## 1 Abstract

## 2 Introduction
MERN is a free open-source JS software stack for building dynamic web sites and web apps. MERN consists of using MongoDB, React, and Node to represent the four key technologies that make up the stack. With the rapid growth of colleges and the prices growing immensely, books are also included in this growth of pricing and classes are continuing to require them each semester. The prices of books can vary between used books, E-books, or brand new. However, if you are ever struggling to find the book that you need or if the school itself is out of stock, it can be very frustrating keeping up with your class without a textbook. After opening the “Borrow Book” web app, users are greeted with a Welcome message and after will allow users to browse books. Browsing books has many different filters so students can find exactly what they are looking for. If a book is selected, two options are given, one is to Message the user and the other is to borrow the book. If either option is chosen, you are then sent straight to the authentication screen where you are given the option to either login with an existing account or sign up for a new account where a profile is created. Once you have either logged in or signed up, you are then redirected straight to the home page where you are given many options to redirect your attention to. There is a help section, an about section, you can Browse books from the home page like how you could before you went through authentication with the same search filters, you can post a book and you can look at your profile or if you found exactly what you need you are also able to log out. To get the book that you want, you must click on the desired book, and you can see the distributors profile, or you can choose to borrow the book. There is also a cart feature where you can rent out more than one book. Once you add the book(s) that you need, you can confirm the books separately and then message the user who is distributing of the book.

## 3 Architectural Design

<font size=4>___3.1 Class Diagram___

<font size=3>Figure 2 shows the class diagram for the book borrowing system. Each user will have a profile and a list of textbooks they are providing. Each textbook will have a user that owns it as well as a condition, type, and class it is used in. The profile and class will help filtering book search later on. The homepage class contains all the functionality of the system such as a user borrowing a textbook, a user viewing their profile, etc. There are many textbooks displayed on the homepage by default which will be shown in section 4.

![Class Diagram](https://github.com/howebe/CIS350Project/blob/main/CIS%20350-ClassDiagram.png?raw=true)<div style="text-align: center">
Figure 2. Class Diagram for Borrowing Books </div>

<font size=4> <b>3.2 Use Case Diagram</b>

<font size=3>Figure 3 shows the general use case for the borrow book web app. Inside the use case, the user can perform 5 tasks. The user can browse books without login by default, but once logged in, the user can browse books, post a book to lend, borrow a book, and view their account. Authentication is automatically part of login and must be done when logging in no matter what. Similarly, when browsing books, there is a search bar to look for specific books as well as an optional filter to narrow down the search. In the borrow book functionality, a user is able to message a lender or just add the book to the cart before borrowing. When a user views their profile they can see the books listed and borrowed, and the user can confirm borrows or returns to make sure the book was actually rented and returned to its owner.

![User Case Diagram](https://github.com/howebe/CIS350Project/blob/main/CIS350-UseCaseDiagram.png?raw=true)<div style="text-align: center"> Figure 3. - Use Case Diagram for Borrowing Books</div>

<font size=4> <b>3.3 Sequence Diagram</b>

<font size=3>Figure 4 shows the sequence diagram for borrowing a book. When the user first opens the webapp they are greeted with a welcome message and sent to the book catalog. The book catalog is a listing of all the books posted with little user functionality. When a user decides to login or create an account, they will be authenicated and allowed functionality that comes with an account. With a successfull login or sign up, the user reaches the home page where they can browse and borrow books. Once a book is selected, the user adds the book to their cart or can cancel the transaction. Both of which will send the user back to the home page. When a user logs out from the home page, they will be sent back to the general catalog.

![User Case Diagram](https://github.com/howebe/CIS350Project/blob/main/CIS%20350-SequenceDiagram.png?raw=true)<div style="text-align: center"> Figure 4. - Sequence Diagram for Borrowing Books </div>

## 4 User Guide/Implementation
