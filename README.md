# CIS350

<font size="5"><b>Textbook Sharing Mobile App

___Created by___:

-------------------------------------------------
Brandon Baker

Ben Howe</b></font>

-------------------------------------------------

## 1 Abstract
University students everywhere around the world know the struggle of needing a significant amount of money every semester, on top of their tuition, just for textbooks. This can be a financial struggle for many students, especially when a textbook is required for the course, forcing them to find the money for it. Due to this, there is a need for students to obtain the textbooks they need, but also ensure that they won’t have to pay large amounts for them. This need sparked the idea to create a book borrowing app for students to help one another by lending old books that students would otherwise have to buy from the school library or other outside vendor for a high price. Through this app, students can post a book to the app where another student can browse through these books to see if they can find what they need. A user can create an account if they want to post a book or search and browse for books. Users are also capable of continuing without signing in if they just would like to see what is availble in the app. Our app gives users an easily accessible user-interface which is quite easy to use. More technical details about the app as well as  the idea of it, use cases, and full software development cycle experience will be touched on more precisely in the text below.

## 2 Introduction
MERN is a free open-source JS software stack for building dynamic web sites and web apps. MERN consists of using MongoDB, React, and Node to represent the four key technologies that make up the stack. With the rapid growth of colleges and the prices growing immensely, books are also included in this growth of pricing and classes are continuing to require them each semester. The prices of books can vary between used books, E-books, or brand new. However, if you are ever struggling to find the book that you need or if the school itself is out of stock, it can be very frustrating keeping up with your class without a textbook. After opening the “Borrow Book” web app, users are greeted with a Welcome message and after will allow users to browse books. Browsing books has many different filters so students can find exactly what they are looking for. If a book is selected, two options are given, one is to Message the user and the other is to borrow the book. If either option is chosen, you are then sent straight to the authentication screen where you are given the option to either login with an existing account or sign up for a new account where a profile is created. Once you have either logged in or signed up, you are then redirected straight to the home page where you are given many options to redirect your attention to. There is a help section, an about section, you can Browse books from the home page like how you could before you went through authentication with the same search filters, you can post a book and you can look at your profile or if you found exactly what you need you are also able to log out. To get the book that you want, you must click on the desired book, and you can see the distributors profile, or you can choose to borrow the book. There is also a cart feature where you can rent out more than one book. Once you add the book(s) that you need, you can confirm the books separately and then message the user who is distributing of the book.

## 3 Architectural Design
The textbook sharing mobile app is based on Flutter Firebase architecture. Flutter includes all user interface design materials, while Firebase allows the user to communicate with the database. It essentially acts as the server and the database (whole back end). The client is provided with an interactive user interface using flutter packages to post a book, login, see the listing of all books, and search. Mentioned earlier, all server and database functionality is handled by Firebase. Firebase handles all requests sent by the client for functionality such as posting and grabbing textbooks from the database.

<figure>
<p align="center">
<img src="https://github.com/howebe/CIS350Project/blob/main/Documentation/CIS350_Arch_Design.png" alt="Trulli"
style="width:75%">
<p align="center">Figure 1. User Interface to Server Design of Textbook Sharing App
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

<font size=3>Figure 3 shows the general use case for the textbook sharing mobile app. Inside the use case, the user can perform 3 tasks. The user can login to their account or create an account, they can browse the listing of books, and they can post a book. Login includes authentification because authentication must be done in order to gain extra app functionality. Once logged in, the user can search for the book that they are interested in. Also, the user can post a textbook to the listing after they have logged in.
  
<figure>
<p align="center">
<img src="https://github.com/howebe/CIS350Project/blob/main/Documentation/CIS350-%20Use%20Case%20Diagram.png" alt="Trulli"
style="width:60%">
<p align="center">Figure 3. Use Case Diagram for Browsing Books
</figcaption>
</p>
</figure>

<font size=4> <b>3.3 Sequence Diagram</b>

<font size=3>Figure 4 shows the sequence diagram for browsing books. The user starts by opening the app, then they will be directed to the welcome page. From the welcome page, they can either try to log in or view the general listing of all the textbooks. If the user successfully signs in or signs up, they will be directed to the home page where they will get added functionality of the app. They will be able to search for a specific book they are looking for. Once they are done searching for a book, they will be brought back to the home page, and logout when they are done. If the user doesn't want to log in and would like to see what books are available, they can see all the books displayed. Once done viewing the general book listing they will be brought back to the welcome page.

<figure>
<p align="center">
<img src="https://github.com/howebe/CIS350Project/blob/main/Documentation/CIS%20350-SequenceDiagram.png" alt="Trulli"
style="width:75%">
<p align="center">Figure 4. Sequence Diagram for Browsing Books
</figcaption>
</p>
</figure>

## 4 User Guide/Implementation
<font size=4>___4.1 Welcome Page___
  
<font size=3>When a user opens the mobile app, they are presented with a welcome screen that allows them to either navigate to view the overall listing of textbooks or login/signup for increased functionality. In order to access features of the mobile app, a user must have/make an account first. Additional functionality for signed in users includes posting a textbook, or searching through textbooks to find the right one for you. The user interface for the welcome page can be seen below in Figure 5.

<figure>
<p align="center">
<img src="https://github.com/howebe/CIS350Project/blob/main/Documentation/Screenshot_1670172782.png" alt="Trulli"
style="width:25%">
<p align="center">Figure 5. Welcome Screen
</figcaption>
</p>
</figure>

<font size=4>___4.2 General Listing___
  
<font size=3>If the user decides that they would like to view the total listing of textbooks without creating an account, they would navigate to this general listings page from the welcome page shown in figure 5. The page displays all the posted textbooks allowing the user to scroll through them. If the user sees a textbook they would like to borrow, they can then navigate back to the welcome page and go the other route towards signing in. The general listing of textbooks is shown below in Figure 6.

<figure>
<p align="center">
<img src="https://github.com/howebe/CIS350Project/blob/main/Documentation/Screenshot_1670172786.png" alt="Trulli"
style="width:25%">
<p align="center">Figure 6. General Textbook Listing
</figcaption>
</p>
</figure>

<font size=4>___4.3 Login___
  
<font size=3>Once the user decides they would like to login, either because they wanted a textbook they saw or they wanted to post a textbook, they would navigate to the authentification screens through a button on the wecome page. This button first shows the login screen for user that already have an account and would like to sign in. If the user doesn't have an account they can navigate to the register option shown in the top right of Figure 7. To register or sign in, the user must verify their email address as well as the password associated with their account. When signing up, the user must use a valid email and password otherwise they will be asked to change their information. The user interface for signing in/up can be seen below in Figure 7.

<figure>
<p align="center">
<img src="https://github.com/howebe/CIS350Project/blob/main/Documentation/Screenshot_1670172792.png" alt="Trulli"
style="width:25%">
<img src="https://github.com/howebe/CIS350Project/blob/main/Documentation/Screenshot_1670172794.png" alt="Trulli"
style="width:25%">
<p align="center">Figure 7. Authenitification Screens
</figcaption>
</p>
</figure>

<font size=4>___4.4 Home Page___
  
<font size=3>When the user has successfully logged in, they will be automatically directed to their home page. The home page consists of two options, posting a book, or searching for a book. When the user is ready to log out of their account, they can click the logout button in the top right to return to the welcome page. The user interface for a users home page can be seen below in Figure 8.
<figure>
<p align="center">
<img src="https://github.com/howebe/CIS350Project/blob/main/Documentation/Screenshot_1670172813.png" alt="Trulli"
style="width:25%">
<p align="center">Figure 8. User's Home Page
</figcaption>
</p>
</figure>

<font size=4>___4.5 Post Textbook___
  
<font size=3>If the user has a textbook they would like to post to the app, they can navigate to the post textbook screen in the user's home page. This screen has two text fields, one for the name of the book, and another for the book's description. Once the user is ready to post their textbook, they can click the post a new book button below, or if they decide they wanted to cancel posting a book they can navigate back to their home page. The user interface for posting a book is shown below in Figure 9.
<figure>
<p align="center">
<img src="https://github.com/howebe/CIS350Project/blob/main/Documentation/Screenshot_1670172930.png" alt="Trulli"
style="width:25%">
<p align="center">Figure 8. Screen to Post a Book
</figcaption>
</p>
</figure>

<font size=4>___4.6 Search Books___
  
<font size=3>If the user wants a specific textbook, they can navigate to search textbooks through their home page. When the user first enters this page, they will see a listing of all the books by default. Once they are ready to search for a specific book, they click on the top bar to the left of the search icon. The user then can search for a book by the name of the textbook. Just like the general listing of books before sign in, the user can scroll through all books found to find the book they are looking for. The search automatically updates as the user types. When finished, they can navigate back to their home page through the arrow in the top left. The user interface for searching for a book can be found below in Figure 10.
<figure>
<p align="center">
<img src="https://github.com/howebe/CIS350Project/blob/main/Documentation/Screenshot_1670172951.png" alt="Trulli"
style="width:25%">
<p align="center">Figure 8. Search Books
</figcaption>
</p>
</figure>
