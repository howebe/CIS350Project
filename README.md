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
The textbook sharing app is an innovation that strives to make students financial situations less stressful and change the process of buying textbooks from univerisity or other outside vendor for outrageous prices that has been in place for decades. Through this app, we strive for students to give back to students, taking out the middleman (universities/vendors) from the process, in turn letting students keep their much needed money. In effort to achieve this, we implemented a codebase using Flutter (client side) and Firebase (server side) which communicate with one another effectively to move data to and from the client side as well as the server side in order to create a highly functioning app that acts as a service to students. All implementation of user interface software, such as listings of books, login components, search components, posting components as well as other miscelaneous parts within the app uses Flutter under the hood. Firebase is responsible for creating user accounts and textbooks as well as grabbing user accounts and textbooks from the database. A user can perform 3 main tasks within the app: login, browse books, and post a book. This user is initally greeted by the welcome page where they can login or continue without signing in. Both options allow for browsing of the inventiory of books but when logged in, you also may post a book to the inventory as well as search by name. Overall implementation of this project demonstrated the complete life cycle of creating a product that can be used in a real life scenario. If more time was alotted to this idea, it has the potential to become at truly useful product for students.

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

<font size=4>___3.1 Class Diagrams___

<font size=3>Figure 2 shows the class diagram for posting a book to the listing. When entering a book, the user must specify the name and descrption of the book. When bosted, the users userID is linked to the book for contacting purposes for the other users that may be browsing the book in the listing. Any user may post as many books as they like and the listing will automatically update with the new book added. This use case was created with the intent of making the posting process as simple as possible for all users involved. The class diagram for this use case can be seen below in figure 2.
  
<figure>
<p align="center">
<img src="https://github.com/howebe/CIS350Project/blob/main/Documentation/Post_book_class_diagram.png" alt="Trulli"
style="width:75%">
<p align="center">Figure 2. Class Diagram for Posting a Book
</figcaption>
</p>
</figure>

<font size=3>Figure 3 shows the class diagram for searching/browsing books in the listing. When the user is in the home page, they are automatically presented with a listing of all of the books currently posted in the listing. If the user is looking for a specific book, they have the ability to search for the book by name by selecting the search icon in the top right corner (which can be seen further below in figure 11). When selected, they are directed to the search page with a search bar where books are listed in accordance with what the user types in the search bar. The class diagram for this use case can be seen below in figure 3.
  
<figure>
<p align="center">
<img src="https://github.com/howebe/CIS350Project/blob/main/Documentation/Search_Browse_book_class_diagram.png" alt="Trulli"
style="width:75%">
<p align="center">Figure 3. Class Diagram for Searching/Browsing for a Book
</figcaption>
</p>
</figure>

<font size=4> <b>3.2 Use Case Diagram</b>

<font size=3>Figure 4 shows the general use case for the textbook sharing mobile app. Inside the use case, the user can perform 3 tasks. The user can login to their account or create an account, they can browse the listing of books, and they can post a book. Login includes authentification because authentication must be done in order to gain extra app functionality. Once logged in, the user can search for the book that they are interested in. Also, the user can post a textbook to the listing after they have logged in.
  
<figure>
<p align="center">
<img src="https://github.com/howebe/CIS350Project/blob/main/Documentation/CIS350-%20Use%20Case%20Diagram.png" alt="Trulli"
style="width:60%">
<p align="center">Figure 4. Use Case Diagram for Browsing Books
</figcaption>
</p>
</figure>

<font size=4> <b>3.3 Sequence Diagram</b>

<font size=3>Figure 5 shows the sequence diagram for browsing books. The user starts by opening the app, then they will be directed to the welcome page. From the welcome page, they can either try to log in or view the general listing of all the textbooks. If the user successfully signs in or signs up, they will be directed to the home page where they will get added functionality of the app. They will be able to search for a specific book they are looking for. Once they are done searching for a book, they will be brought back to the home page, and logout when they are done. If the user doesn't want to log in and would like to see what books are available, they can see all the books displayed. Once done viewing the general book listing they will be brought back to the welcome page.

<figure>
<p align="center">
<img src="https://github.com/howebe/CIS350Project/blob/main/Documentation/CIS%20350-SequenceDiagram.png" alt="Trulli"
style="width:75%">
<p align="center">Figure 5. Sequence Diagram for Browsing Books
</figcaption>
</p>
</figure>

## 4 User Guide/Implementation
<font size=4>___.1 Welcome Page___
  
<font size=3>When a user opens the mobile app, they are presented with a welcome screen that allows them to either navigate to view the overall listing of textbooks or login/signup for increased functionality. In order to access features of the mobile app, a user must have/make an account first. Additional functionality for signed in users includes posting a textbook, or searching through textbooks to find the right one for you. The user interface for the welcome page can be seen below in Figure 6.

<figure>
<p align="center">
<img src="https://github.com/howebe/CIS350Project/blob/main/Documentation/Screenshot_1670172782.png" alt="Trulli"
style="width:25%">
<p align="center">Figure 6. Welcome Screen
</figcaption>
</p>
</figure>

<font size=4>___4.2 General Listing___
  
<font size=3>If the user decides that they would like to view the total listing of textbooks without creating an account, they would navigate to this general listings page from the welcome page shown in figure 5. The page displays all the posted textbooks allowing the user to scroll through them. If the user sees a textbook they would like to borrow, they can then navigate back to the welcome page and go the other route towards signing in. The general listing of textbooks is shown below in Figure 7.

<figure>
<p align="center">
<img src="https://github.com/howebe/CIS350Project/blob/main/Documentation/Screenshot_1670172786.png" alt="Trulli"
style="width:25%">
<p align="center">Figure 7. General Textbook Listing
</figcaption>
</p>
</figure>

<font size=4>___4.3 Login___
  
<font size=3>Once the user decides they would like to login, either because they wanted a textbook they saw or they wanted to post a textbook, they would navigate to the authentification screens through a button on the wecome page. This button first shows the login screen for user that already have an account and would like to sign in. If the user doesn't have an account they can navigate to the register option shown in the top right of Figure 8. To register or sign in, the user must verify their email address as well as the password associated with their account. When signing up, the user must use a valid email and password otherwise they will be asked to change their information. The user interface for signing in/up can be seen below in Figure 8.

<figure>
<p align="center">
<img src="https://github.com/howebe/CIS350Project/blob/main/Documentation/Screenshot_1670172792.png" alt="Trulli"
style="width:25%">
<img src="https://github.com/howebe/CIS350Project/blob/main/Documentation/Screenshot_1670172794.png" alt="Trulli"
style="width:25%">
<p align="center">Figure 8. Authenitification Screens
</figcaption>
</p>
</figure>

<font size=4>___4.4 Home Page___
  
<font size=3>When the user has successfully logged in, they will be automatically directed to their home page. The home page consists of two options, posting a book, or searching for a book. When the user is ready to log out of their account, they can click the logout button in the top right to return to the welcome page. The user interface for a users home page can be seen below in Figure 9.
<figure>
<p align="center">
<img src="https://github.com/howebe/CIS350Project/blob/main/Documentation/Screenshot_1670172813.png" alt="Trulli"
style="width:25%">
<p align="center">Figure 9. User's Home Page
</figcaption>
</p>
</figure>

<font size=4>___4.5 Post Textbook___
  
<font size=3>If the user has a textbook they would like to post to the app, they can navigate to the post textbook screen in the user's home page. This screen has two text fields, one for the name of the book, and another for the book's description. Once the user is ready to post their textbook, they can click the post a new book button below, or if they decide they wanted to cancel posting a book they can navigate back to their home page. The user interface for posting a book is shown below in Figure 10.
<figure>
<p align="center">
<img src="https://github.com/howebe/CIS350Project/blob/main/Documentation/Screenshot_1670172930.png" alt="Trulli"
style="width:25%">
<p align="center">Figure 10. Screen to Post a Book
</figcaption>
</p>
</figure>

<font size=4>___4.6 Search Books___
  
<font size=3>If the user wants a specific textbook, they can navigate to search textbooks through their home page. When the user first enters this page, they will see a listing of all the books by default. Once they are ready to search for a specific book, they click on the top bar to the left of the search icon. The user then can search for a book by the name of the textbook. Just like the general listing of books before sign in, the user can scroll through all books found to find the book they are looking for. The search automatically updates as the user types. When finished, they can navigate back to their home page through the arrow in the top left. The user interface for searching for a book can be found below in Figure 11.
<figure>
<p align="center">
<img src="https://github.com/howebe/CIS350Project/blob/main/Documentation/Screenshot_1670172951.png" alt="Trulli"
style="width:25%">
<p align="center">Figure 11. Search Books
</figcaption>
</p>
</figure>

## 5 Risk analysis and Retrospective
Having a team that may not be able to get the job done as well as not be as effective in development and knowing what architecture pattern to use to provide a user with an effective solution to sharing textbooks were risks due to multiple factors. For example, The project was initally created as a webapp using a MERN stack. We then realized that a webapp may not target the demographic of student users, given that nearly every student in modern day has a smartphone, and uses it quite often. With this in mind, we decided to make the change of our idea to an app using Flutter with MongoDB on the server side. This was a risk due to time constraints, and time wasted trying to develop a webapp using MERN. Similarlly, due to diffuclulties with getting MongoDB to achieve what we had in our scope, we then decided to make the change to Firebase for our back end even later in the project life cycle which was definitely a risk due to time constraints. Teamwork was a problem due to a team member dropping out of the team in the middle of the project as well as some remaining team members not being as effective in producing results, unfortunately putting more weight on others. To combat these issues, we modified scope, created attainable objectives, and remained transparent in our progression and availability to work on the project. What was achieved by the end of the project cycle was some great functionality that needs quite a bit of work if it were to become a marketable product. Nonetheless, The textbook sharing app is a great base layer for a potentially great product. Retrospectively, the team could have made meeting times more structured throughout each week, rather than impromptu meetings as well as impromptu times where a single team member may be working on the codebase.The team could have also maintained the Jira scheduling and other non software related components to the project better and more frequently. Being less focused on solely the codebase in our case may have benefitted us by keeping ideas and the development cycle checkpoints in check. Contrary, this was a sucessful first iteration of a software development cycle for the team.
