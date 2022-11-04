# CIS350

<font size="5"><b>Textbook Borrowing Web App

___Created by___:

-------------------------------------------------
Brandon Baker

Ben Howe

Sean O'Keefe</b></font>

-------------------------------------------------

## 1 Abstract
Textbooks are one of the most important ways to learn in a lot of college courses. However, with the increase in college students, textbooks seem to run out often and having to wait for them to be in stock again is not ideal. Due to this, there is a need for students to have another source of getting these textbooks, but to also ensure that they won’t have to pay the absurd amount of money that is needed to purchase these books. The idea behind our full-stack Book Borrowing web application is to help students who need books that may go out of stock quicker than others and to avoid any extra costs. The student can create an account, an get started instantly. Our web application gives students an easily accessible user-interface which is quite easy to use. Students can use many filters offered to search for the book they need. It is easy to use and will allow for students to check books out from other students who have the textbook from previously taking the course. Students then are responsible for returning these books to allow for them to get added back into the system. The Borrow Book web application will help relive students with the stress of paying for books or missing out if they try to order them too late when they are out of stock.

## 2 Introduction
MERN is a free open-source JS software stack for building dynamic web sites and web apps. MERN consists of using MongoDB, React, and Node to represent the four key technologies that make up the stack. With the rapid growth of colleges and the prices growing immensely, books are also included in this growth of pricing and classes are continuing to require them each semester. The prices of books can vary between used books, E-books, or brand new. However, if you are ever struggling to find the book that you need or if the school itself is out of stock, it can be very frustrating keeping up with your class without a textbook. After opening the “Borrow Book” web app, users are greeted with a Welcome message and after will allow users to browse books. Browsing books has many different filters so students can find exactly what they are looking for. If a book is selected, two options are given, one is to Message the user and the other is to borrow the book. If either option is chosen, you are then sent straight to the authentication screen where you are given the option to either login with an existing account or sign up for a new account where a profile is created. Once you have either logged in or signed up, you are then redirected straight to the home page where you are given many options to redirect your attention to. There is a help section, an about section, you can Browse books from the home page like how you could before you went through authentication with the same search filters, you can post a book and you can look at your profile or if you found exactly what you need you are also able to log out. To get the book that you want, you must click on the desired book, and you can see the distributors profile, or you can choose to borrow the book. There is also a cart feature where you can rent out more than one book. Once you add the book(s) that you need, you can confirm the books separately and then message the user who is distributing of the book.

## 3 Architectural Design
The Book Borrow Web app is based on the MERN architecture. MERN includes a front end and a back end where the front end is the user interface, and the back end is controlled by a server and database. The client is provided with an interactive user interface using React for the process of renting out books and many other functions available. The back end or server-side processes will be enabled using node and express. The client sends requests to the server to allow for books to be rented. Node and express communicate this data with mongoDB. Node and express are the middlemen for communicating the information from mongo to the user. The server also allows the user to check their profile and check any information regarding past books that they had rented out. 

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
<font size=4>___4.1 Login___
  
<font size=3>When a user visits the webapp using a search engine of their choice, they are presented with a screen that prompts them to enter their login credentials or to create a new account. In order to access the features of the webapp, a user must have/make an account first. Account information will be further explained below in section 4.3 and figure 7. An example user interface can for the login screen can be seen below:
<figure>
<p align="center">
<img src="https://github.com/howebe/CIS350Project/blob/main/Frame%2014.png" alt="Trulli"
style="width:75%">
<p align="center">Figure 5. Example User Interface for Login Screen
</figcaption>
</p>
</figure>

<font size=4>___4.2 Home Page___
  
<font size=3>After you have logged into a valid account, you are directed to the home page which acts as a hub to all of the different things you may want to explore or do within the webapp. Users have the ability to Browse books posted by other users as well as filter down their search results to look for a specific textbook they may want. They also have the ability to post a book to the listing for others to interact with and potentially claim.You may also access your profile inforation as well as other functions associated with your profile. Lastly there is options for help with a specific task and information about the webapp and its inspiration. An user interface example of this can be seen below in figure 6:
<figure>
<p align="center">
<img src="https://github.com/howebe/CIS350Project/blob/main/Frame%201.png" alt="Trulli"
style="width:75%">
<p align="center">Figure 6. Example User Interface for Home Screen
</figcaption>
</p>
</figure>

<font size=4>___4.3 Profile___
  
<font size=3>By selecting a users profile in the top right corner in the home page, the user will be presented with a new window where they can see their information linked to their account such as their name, email, school, and profile rating. Ratings are based off of user to user interactions in regards to borrowing transactions. They may aslo see their borrow history and book listings as well as return a book and edit the settings of their profile or book listings. A user interface example of this can be seen below in figure 7:
<figure>
<p align="center">
<img src="https://github.com/howebe/CIS350Project/blob/main/Frame%2019.png" alt="Trulli"
style="width:75%">
<p align="center">Figure 7. Example User Interface for Profile Screen
</figcaption>
</p>
</figure>

<font size=4>___4.4 Filtering Results___
  
<font size=3>When browsing the listings for a specific book, a user has the ability to filter the results presented to them more easily find a specific textbook they are looking for. Below in figure 8, the ability to search for a textbook, filter by what university the current owner of the textbook attends, what grade level, subject, and class number the textbook is associated with as well as its condition and type, whether that be an ebook or paperback. By pressing search, the filters adjusted by the user will be applied and the results will be passed up into the listings section of the webapp. A user interface example of this can be seen below in figure 8:
<figure>
<p align="center">
<img src="https://github.com/howebe/CIS350Project/blob/main/Frame%2024.png" alt="Trulli"
style="width:75%">
<p align="center">Figure 8. Example User Interface for Filtering Screen
</figcaption>
</p>
</figure>
