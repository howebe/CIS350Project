# CIS350

<font size="5"><b>Textbook Sharing Mobile App

___Created by___:

-------------------------------------------------
Brandon Baker

Ben Howe</b></font>

-------------------------------------------------

## 1 Abstract
Textbooks are one of the most important ways to learn in a lot of college courses. However, with the increase in college students, textbooks seem to run out often and having to wait for them to be in stock again is not ideal. Due to this, there is a need for students to have another source of getting these textbooks, but to also ensure that they won’t have to pay the absurd amount of money that is needed to purchase these books. The idea behind our full-stack Book Borrowing web application is to help students who need books that may go out of stock quicker than others and to avoid any extra costs. The student can create an account, an get started instantly. Our web application gives students an easily accessible user-interface which is quite easy to use. Students can use many filters offered to search for the book they need. It is easy to use and will allow for students to check books out from other students who have the textbook from previously taking the course. Students then are responsible for returning these books to allow for them to get added back into the system. The Borrow Book web application will help relive students with the stress of paying for books or missing out if they try to order them too late when they are out of stock.

## 2 Introduction
MERN is a free open-source JS software stack for building dynamic web sites and web apps. MERN consists of using MongoDB, React, and Node to represent the four key technologies that make up the stack. With the rapid growth of colleges and the prices growing immensely, books are also included in this growth of pricing and classes are continuing to require them each semester. The prices of books can vary between used books, E-books, or brand new. However, if you are ever struggling to find the book that you need or if the school itself is out of stock, it can be very frustrating keeping up with your class without a textbook. After opening the “Borrow Book” web app, users are greeted with a Welcome message and after will allow users to browse books. Browsing books has many different filters so students can find exactly what they are looking for. If a book is selected, two options are given, one is to Message the user and the other is to borrow the book. If either option is chosen, you are then sent straight to the authentication screen where you are given the option to either login with an existing account or sign up for a new account where a profile is created. Once you have either logged in or signed up, you are then redirected straight to the home page where you are given many options to redirect your attention to. There is a help section, an about section, you can Browse books from the home page like how you could before you went through authentication with the same search filters, you can post a book and you can look at your profile or if you found exactly what you need you are also able to log out. To get the book that you want, you must click on the desired book, and you can see the distributors profile, or you can choose to borrow the book. There is also a cart feature where you can rent out more than one book. Once you add the book(s) that you need, you can confirm the books separately and then message the user who is distributing of the book.

## 3 Architectural Design
The textbook sharing mobile app is based on Flutter Firebase architecture. Flutter includes all user interface design materials, while Firebase allows the user to communicate with the database. It essentially acts as the server and the database (whole back end). The client is provided with an interactive user interface using flutter packages to post a book, login, see the listing of all books, and search. Mentioned earlier, all server and database functionality is handled by Firebase. Firebase handles all requests sent by the client for functionality such as posting and grabbing textbooks from the database.

<figure>
<p align="center">
<img src="https://user-images.githubusercontent.com/71044494/193474192-3c65a107-84dd-420d-94c9-44dceadf897b.png" alt="Trulli"
style="width:50%">
<p align="center">Figure 1. User Interface to Server Design of Book Borrowing System
</figcaption>
</p>
</figure>

<font size=4>___3.1 Class Diagram___

<font size=3>Figure 2 shows the class diagram for the book borrowing system. Each user will have a profile and a list of textbooks they are providing. Each textbook will have a user that owns it as well as a condition, type, and class it is used in. The profile and class will help filtering book search later on. The homepage class contains all the functionality of the system such as a user borrowing a textbook, a user viewing their profile, etc. There are many textbooks displayed on the homepage by default which will be shown in section 4.
  
<figure>
<p align="center">
<img src="https://github.com/howebe/CIS350Project/blob/main/CIS%20350-ClassDiagram.png" alt="Trulli"
style="width:75%">
<p align="center">Figure 2. Class Diagram for Borrowing Books
</figcaption>
</p>
</figure>

<font size=4> <b>3.2 Use Case Diagram</b>

<font size=3>Figure 3 shows the general use case for the borrow book web app. Inside the use case, the user can perform 5 tasks. The user can browse books without login by default, but once logged in, the user can browse books, post a book to lend, borrow a book, and view their account. Authentication is automatically part of login and must be done when logging in no matter what. Similarly, when browsing books, there is a search bar to look for specific books as well as an optional filter to narrow down the search. In the borrow book functionality, a user is able to message a lender or just add the book to the cart before borrowing. When a user views their profile they can see the books listed and borrowed, and the user can confirm borrows or returns to make sure the book was actually rented and returned to its owner.
  
<figure>
<p align="center">
<img src="https://github.com/howebe/CIS350Project/blob/main/CIS350-UseCaseDiagram.png" alt="Trulli"
style="width:60%">
<p align="center">Figure 3. Use Case Diagram for Borrowing Books
</figcaption>
</p>
</figure>

<font size=4> <b>3.3 Sequence Diagram</b>

<font size=3>Figure 4 shows the sequence diagram for borrowing a book. When the user first opens the webapp they are greeted with a welcome message and sent to the book catalog. The book catalog is a listing of all the books posted with little user functionality. When a user decides to login or create an account, they will be authenicated and allowed functionality that comes with an account. With a successfull login or sign up, the user reaches the home page where they can browse and borrow books. Once a book is selected, the user adds the book to their cart or can cancel the transaction. Both of which will send the user back to the home page. When a user logs out from the home page, they will be sent back to the general catalog.

<figure>
<p align="center">
<img src="https://github.com/howebe/CIS350Project/blob/main/CIS%20350-SequenceDiagram.png" alt="Trulli"
style="width:75%">
<p align="center">Figure 4. Sequence Diagram for Borrowing Books
</figcaption>
</p>
</figure>

## 4 User Guide/Implementation
<font size=4>___4.1 Welcome Page___
  
<font size=3>When a user opens the mobile app, they are presented with a welcome screen that allows them to either navigate to view the overall listing of textbooks or login/signup for increased functionality. In order to access features of the mobile app, a user must have/make an account first. Additional functionality for signed in users includes posting a textbook, or searching through textbooks to find the right one for you. The user interface for the welcome page can be seen below in Figure 5.

<figure>
<p align="center">
<img src="https://github.com/howebe/CIS350Project/blob/main/Frame%2014.png" alt="Trulli"
style="width:75%">
<p align="center">Figure 5. Example User Interface for Login Screen
</figcaption>
</p>
</figure>

<font size=4>___4.2 General Listing___
  
<font size=3>If the user decides that they would like to view the total listing of textbooks without creating an account, they would navigate to this general listings page from the welcome page shown in figure 5. The page displays all the posted textbooks allowing the user to scroll through them. If the user sees a textbook they would like to borrow, they can then navigate back to the welcome page and go the other route towards signing in. The general listing of textbooks is shown below in Figure 6.

<figure>
<p align="center">
<img src="https://github.com/howebe/CIS350Project/blob/main/Frame%201.png" alt="Trulli"
style="width:75%">
<p align="center">Figure 6. Example User Interface for Home Screen
</figcaption>
</p>
</figure>

<font size=4>___4.3 Login___
  
<font size=3>Once the user decides they would like to login, either because they wanted a textbook they saw or they wanted to post a textbook, they would navigate to the authentification screens through a button on the wecome page. This button first shows the login screen for user that already have an account and would like to sign in. If the user doesn't have an account they can navigate to the register option shown in the top right of Figure 7. To register or sign in, the user must verify their email address as well as the password associated with their account. When signing up, the user must use a valid email and password otherwise they will be asked to change their information. The user interface for signing in/up can be seen below in Figure 7.

<figure>
<p align="center">
<img src="https://github.com/howebe/CIS350Project/blob/main/Frame%2019.png" alt="Trulli"
style="width:75%">
<p align="center">Figure 7. Example User Interface for Profile Screen
</figcaption>
</p>
</figure>

<font size=4>___4.4 Home Page___
  
<font size=3>When the user has successfully logged in, they will be automatically directed to their home page. The home page consists of two options, posting a book, or searching for a book. When the user is ready to log out of their account, they can click the logout button in the top right to return to the welcome page. The user interface for a users home page can be seen below in Figure 8.
<figure>
<p align="center">
<img src="https://github.com/howebe/CIS350Project/blob/main/Frame%2024.png" alt="Trulli"
style="width:75%">
<p align="center">Figure 8. Example User Interface for Filtering Screen
</figcaption>
</p>
</figure>

<font size=4>___4.5 Post Textbook___
  
<font size=3>If the user has a textbook they would like to post to the app, they can navigate to the post textbook screen in the user's home page. This screen has two text fields, one for the name of the book, and another for the book's description. Once the user is ready to post their textbook, they can click the post a new book button below, or if they decide they wanted to cancel posting a book they can navigate back to their home page. The user interface for posting a book is shown below in Figure 9.
<figure>
<p align="center">
<img src="https://github.com/howebe/CIS350Project/blob/main/Frame%2024.png" alt="Trulli"
style="width:75%">
<p align="center">Figure 8. Example User Interface for Filtering Screen
</figcaption>
</p>
</figure>

<font size=4>___4.6 Search Books___
  
<font size=3>If the user wants a specific textbook, they can navigate to search textbooks through their home page. When the user first enters this page, they will see a listing of all the books by default. Once they are ready to search for a specific book, they click on the top bar to the left of the search icon. The user then can search for a book by the name of the textbook. Just like the general listing of books before sign in, the user can scroll through all books found to find the book they are looking for. The search automatically updates as the user types. When finished, they can navigate back to their home page through the arrow in the top left. The user interface for searching for a book can be found below in Figure 10.
<figure>
<p align="center">
<img src="https://github.com/howebe/CIS350Project/blob/main/Frame%2024.png" alt="Trulli"
style="width:75%">
<p align="center">Figure 8. Example User Interface for Filtering Screen
</figcaption>
</p>
</figure>
