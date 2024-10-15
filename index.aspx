<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Project.NET.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

                :root {
  /* this has to be set to switch between light or dark */
  color-scheme: light dark;

  --light-bg: ghostwhite;
  --light-color: darkslategray;
  --light-code: tomato;

  --dark-bg: rgb(8 30 59);
  --dark-color: ghostwhite;
  --dark-code: gold;
}
* {
  background-color: light-dark(var(--light-bg), var(--dark-bg));
  color: light-dark(var(--light-color), var(--dark-color));
}
code {
  color: light-dark(var(--light-code), var(--dark-code));
}

.light {
  /* forces light color-scheme */
  color-scheme: light;
}
.dark {
  /* forces dark color-scheme */
  color-scheme: dark;
}
    body {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    }
    .auto-style2 {
        width: 151px;
        height: 88px;
        border: 2px maroon solid;
        border-radius: 10%;
        box-shadow: 4px 4px black;
    }

    nav {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px;
        background:radial-gradient(ellipse at top,blue,silver),
        radial-gradient(ellipse at bottom,cyan,silver);
        flex-wrap: wrap; /* Allows items to wrap on smaller screens */
        height:fit-content;
    }

    .title {
        flex-grow: 1;
        text-align: center;
        font-size: 1.5rem;
        padding: 20px 50px;
    }

    .login-button {
        cursor:pointer;
    }
    h2{
    background-color:cornsilk;
    color:rgb(81, 215, 231);
    text-align:center;
    box-shadow: 3px 3px rgb(56, 55, 55);
    text-shadow:2px 2px rgb(8, 27, 60);
    }
    .menu {
        padding:10px 10px 0px 20px;
        display: flex;
        width:100%;
        background:transparent;
        flex-direction:row; 
        justify-content:space-between;

    }

    .menu-button {
        align-items:flex-start;
        width: 100%;
        background-color: transparent;
        display:flex;
        column-gap:30px;
    }

    .menu-end{
        align-items:flex-end;
        width: 100%;
        text-align: right;
        background-color: transparent;
        margin: 5px;
    }

    } .image-container {
        position: relative; /* Allow absolute positioning of the overlay text */
        display: inline-block; /* Ensure the container only takes up the size of the image */
    }

    .overlay-text {
        position: absolute; /* Position text absolutely within the image container */
        top: 50%; /* Center vertically */
        left: 50%; /* Center horizontally */
        transform: translate(-50%, -50%); /* Adjust position to truly center the text */
        background: linear-gradient(rgb(237, 229, 229,20),transparent); /* Semi-transparent black background */
        color: white; /* Text color */
        padding: 10px; /* Padding around the text */
        border-radius: 5px; /* Rounded corners for the background */
        text-align: center; /* Center the text within the overlay */
        font-size: 18px; /* Adjust font size as needed */
        width: 80%; /* Adjust width as needed */
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3); /* Optional: Add shadow for better visibility */
    }
    .auto-style10 {
    width: 100%; /* Image will take 100% of its container's width */
    max-width: 100%; /* Prevents the image from overflowing its container */
    height: auto; /* Maintains the aspect ratio */
    box-shadow: 5px 5px gold;
    border-radius: 2%;
    
    }
    /* Main container */
.brands-container {
    width: 100%;
    overflow: hidden;
    background-color: #f5f5f5;
    padding: 20px 0;
}

/* Track to hold all the brands */
.brands-track {
    display: flex;
    animation: scroll 30s linear infinite;
}

/* Individual brand logos */
.brand {
    flex: 0 0 200px; /* Logo width is flexible but fixed at 200px */
    margin: 0 15px; /* Evenly spaced */
}

.brand img {
    
    height: 100px;
    width: 100%;
    object-fit: contain;
    display: block;
}
/* General table layout */
.auto-style12 {
    width: 100%;
    justify-content: center;
    margin: 0 auto;
}

/* For notice, admission, and event sections */
.auto-style19, .auto-style20, .auto-style21, .auto-style24 {
    border-radius: 12%;
    box-shadow: 4px 4px 8px 8px darkgray;
    background-repeat: no-repeat;
    background-size: cover;
    width: 100%;
    height: auto;
    padding: 20px;
    margin-bottom: 20px;
}

/* GridView styling to take full width */
.auto-style16 {
    width: 100%;
    text-align: center;
}

.auto-style25 {
    width: 100%;
}

/* Adjust fonts and spacing */
.auto-style15, .auto-style22 {
    text-align: center;
    font-size: 2rem;
}
.slider-container {
    position: relative;
    width: 100%;
    height: 40rem;
    display: flex;
    justify-content: flex-start;
    align-items: center;
    overflow: hidden;
}

.slider {
    position: relative;
    width: 400%;
    height: 100%;
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: space-between;
    animation: 30s cubic-bezier(1, 0.95, 0.565, 1) sliding infinite;
}

.slide {
    position: relative;
    min-width: 100%;
    height: 100%;
    background-size: cover;
    background-position: center;
}

.slide .caption {
    position: absolute;
    left: 0;
    bottom: 5%;
    font-size: 4rem;
    font-weight: 600;
    color: white;
    text-transform: capitalize;
    background: rgba(0, 0, 0, 0.4);
    backdrop-filter: blur(10px);
    padding: 1rem 5rem;
    border-radius: 0 2rem 2rem 0;
    transition: font-size 0.3s ease;
}

/* Individual slide backgrounds */
.slide.one {
    background-image: url("Images/WhatsApp Image 2024-09-11 at 11.27.19_8bfb5916.jpg");
}
.slide.two {
    background-image: url("Images/WhatsApp.jpg");
}
.slide.three {
    background-image: url("Images/WhatsApp2.jpg");
}
.slide.four {
    background-image: url("Images/WhatsApp3.jpg");
}

/* Keyframe animation for sliding effect */
@keyframes sliding {
    0%, 20% {
        transform: translateX(0%);
    }
    25%, 45% {
        transform: translateX(-100%);
    }
    50%, 70% {
        transform: translateX(-200%);
    }
    75%, 95% {
        transform: translateX(-300%);
    }
    100% {
        transform: translateX(0%);
    }
}


/* Media Queries for Responsive Design */

/* Tablets */
@media (max-width: 768px) {
    .slider-container {
        height: 30rem; /* Reduce slider height for smaller screens */
    }

    .slide .caption {
        font-size: 2.5rem; /* Adjust caption font size */
        padding: 1rem 3rem;
    }
}

/* Mobile Devices */
@media (max-width: 480px) {
    .slider-container {
        height: 20rem; /* Further reduce height for mobile screens */
    }

    .slide .caption {
        font-size: 1.8rem; /* Further adjust caption size */
        padding: 1rem 2rem;
    }

    .slider {
        animation: 20s cubic-bezier(1, 0.95, 0.565, 1) sliding infinite; /* Speed up animation for smaller screens */
    }
}

    /* Responsive styles */
    @media (max-width: 768px) {
        nav {
            flex-direction: column;
            align-items: center;
        }

        .title {
            padding: 10px;
            font-size: 1.2rem;
        }

        .auto-style2 {
            width: 120px;
            height: 70px;
        }

        .login-button {
            margin-top: 10px;
            margin-left: 0;
        }
    }

    @media (max-width: 480px) {
        .title {
            font-size: 1rem;
            padding: 10px;
        }

        .auto-style2 {
            width: 100px;
            height: 60px;
        }

        .login-button {
            width: 80px;
            height: 30px;
        }
    }
    /* Media query for tablets */
    @media (max-width: 768px) {
        .menu-button {
            width: 48%; /* Adjusts the width for two items per row */
        }
    }

    /* Media query for smaller screens (phones) */
    @media (max-width: 480px) {
        .menu-button {
            width: 100%; /* Each button takes the full width */
            margin: 3px 0; /* Reduces the gap between buttons */
        }
    }
    @media (min-width: 1200px) {
    .auto-style10 {
        width:100%; /* Larger screens get a narrower image */
        margin: 0 auto; /* Center the image */
    }
}

/* For medium screens (tablets) */
@media (max-width: 768px) {
    .auto-style10 {
        width: 95%; /* Slight padding around the image */
    }
}

/* For small screens (phones) */
@media (max-width: 480px) {
    .auto-style10 {
        width: 100%; /* Full width on small screens */
        box-shadow: none; /* Remove box-shadow on small screens for simplicity */
    }
    }
    /* Keyframes for smooth horizontal scrolling */
@keyframes scroll {
    0% {
        transform: translateX(0);
    }
    100% {
        transform: translateX(-100%);
    }
}

/* Font styling for the header */
.auto-style27 {
    text-align: center;
    font-size: 3rem;
}

/* Media queries for responsiveness */

/* Larger screens */
@media (min-width: 1200px) {
    .brand {
        flex: 0 0 180px; /* Slightly smaller logos */
    }
}

/* Tablets and medium-sized screens */
@media (max-width: 768px) {
    .brand {
        flex: 0 0 150px; /* Smaller logos for tablets */
        margin: 0 10px;
    }

    /* Slowing down the animation for smaller devices */
    .brands-track {
        animation: scroll 40s linear infinite;
    }
}

/* Small screens (mobile) */
@media (max-width: 480px) {
    .brand {
        flex: 0 0 100px; /* Smaller logos for mobile */
        margin: 0 5px;
    }

    .auto-style27 {
        font-size: 2rem; /* Smaller font size for mobile */
    }

    /* Further slowing down the animation for mobile */
    .brands-track {
        animation: scroll 50s linear infinite;
    }
}
/* Media queries for responsiveness */

/* Medium screens (tablets) */
@media (max-width: 768px) {
    .auto-style19, .auto-style20, .auto-style21, .auto-style24 {
        width: 100%;
        margin: 10px 0;
    }

    .auto-style16, .auto-style25 {
        width: 90%;
        margin-left: 5%;
    }

    .auto-style15, .auto-style22 {
        font-size: 1.8rem;
    }
}

/* Small screens (mobile) */
@media (max-width: 480px) {
    .auto-style19, .auto-style20, .auto-style21, .auto-style24 {
        width: 100%;
        margin: 10px 0;
        height: auto;
    }

    .auto-style16, .auto-style25 {
        width: 100%;
    }

    .auto-style15, .auto-style22 {
        font-size: 1.5rem;
    }

}
        .auto-style32 {
            border-radius: 12%;
            box-shadow: 4px 4px 8px 8px darkgray;
            background-size: cover;
            width: 50%;
            height: 404px;
            margin: 10px 0;
            padding: 20px;
            background-repeat: no-repeat;
        }
        .auto-style33 {
            border-radius: 12%;
            box-shadow: 4px 4px 8px 8px darkgray;
            background-size: cover;
            width: 50%;
            height: 405px;
            margin: 10px 0;
            padding: 20px;
            background-repeat: no-repeat;
        }
        #Notice{
            background-image:url("Images/notice-bg.png");
            background-repeat:no-repeat;
            background-size: 100% 100%;
        }
        #Admission{
    background-image:url("Images/about-bg.png");
    background-repeat:no-repeat;
    background-size: 100% 100%;
}
         #Event{
    background-image:url("Images/event-bg.jpg");
    background-repeat:no-repeat;
    background-size: 100% 100%;
    --light-bg: transparent;
    --light-color:white;
}
         #About{
    background-image:url("Images/admission-bg.png");
    background-repeat:no-repeat;
    background-size: 100% 100%;
}
         .professors-container {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: 20px;
  padding: 20px;
}

.professor-card {
  background-color: white;
  border-radius: 8px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
  overflow: hidden;
  transition: transform 0.3s ease, box-shadow 0.3s ease;
  width: calc(33.333% - 20px); /* 3 cards per row with gap */
  text-align: center;
}

.professor-card:hover {
  transform: scale(1.05);
  box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
}

.professor-image {
  width: 100%;
  height: auto;
  object-fit: cover;
}

.professor-info {
  padding: 15px;
}

.professor-info h3 {
  margin-bottom: 10px;
  font-size: 1.2em;
}

.professor-info p {
  color: #555;
  font-size: 0.9em;
}

/* Responsive adjustments */
@media (max-width: 1200px) {
  .professor-card {
    width: calc(50% - 20px); /* 2 cards per row on medium screens */
  }
}

@media (max-width: 768px) {
  .professor-card {
    width: calc(100% - 20px); /* 1 card per row on small screens */
  }
}

@media (max-width: 480px) {
  .professor-card {
    width: calc(100% - 10px); /* 1 card per row with smaller gap on extra small screens */
  }
}
.footer {
  background-color: rgb(184, 14, 106);
  color: #fff;
  padding: 20px;
  display: flex;
  flex-direction: column;
}

.footer-content {
  display: flex;
  justify-content: space-between;
  flex-wrap: wrap;
}

.footer-section {
  flex: 1;
  margin: 10px;
}

.footer-section h4 {
  margin-bottom: 10px;
  font-size: 1.2em;
}

.footer-section p {
  margin: 0;
}

.footer-section a {
  color: #164aea;
  text-decoration: none;
}

.footer-section a:hover {
  text-decoration: underline;
}

.footer-bottom {
  border-top: 1px solid #444;
  padding-top: 10px;
  text-align: right;
  font-size: 0.8em;
}

.footer-bottom p {
  margin: 0;
}

/* Responsive adjustments */
@media (max-width: 768px) {
  .footer-content {
    flex-direction: column;
    align-items: center;
    text-align: center;
  }

  .footer-section {
    margin: 10px 0;
  }
}
  .image-container {
    position: relative;
    width: 100%;
    max-width: 100%;
    overflow: hidden;
}

.image-container img {
    width: 100%;
    height: auto;
    display: block;
}

.overlay-text {
    position: absolute;
    bottom: 10%;
    left: 50%;
    width: 90%;
    padding: 15px;
    color: white;
    font-size: 16px;
    line-height: 1.5;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
}

.overlay-text h3 {
    margin: 0;
}
@media (max-width: 768px) {
    .overlay-text {
        font-size: 14px;
        bottom: 5%;
        left: 50%;
        padding: 10px;
    }

    .overlay-text h3 {
        font-size: 16px;
    }
}

@media (max-width: 480px) {
    .overlay-text {
        font-size: 12px;
        bottom: 5%;
        left: 50%;
        padding: 8px;
    }

    .overlay-text h3 {
        font-size: 14px;
    }
}
.info-container {
        background-color: transparent; /* Light background for the section */
        border: 1px solid #ddd; /* Subtle border */
        border-radius: 8px; /* Rounded corners */
        padding: 20px;
        font-family: Arial, sans-serif; /* Simple, clean font */
        max-width: 600px; /* Limit the width for better readability */
        margin: 20px auto; /* Center the section */
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Add a soft shadow */
    }

    .info-container p {
        font-size: 16px; /* Comfortable text size */
        line-height: 1.6; /* Improve readability */
        color: #333; /* Dark text color */
        margin-bottom: 15px;
    }

    .info-container p:last-of-type {
        margin-bottom: 0; /* Remove bottom margin from the last paragraph */
    }

    .highlight {
        color: #2c7dfa; /* Highlight important info in a blue color */
        font-weight: bold; /* Make highlighted text bold */
    }

    .info-container .scholarship {
        background-color: #e7f3ff; /* Soft blue background for emphasis */
        padding: 10px;
        border-radius: 5px;
    }

    .info-container .student-credit-card {
        background-color: #ffe7d9; /* Soft orange background for emphasis */
        padding: 10px;
        border-radius: 5px;
    }


        .auto-style34 {
            position: relative;
            display: inline-block;
            width: 100%;
            max-width: 100%;
            overflow: hidden;
            left: 0px;
            top: 5px;
        }

        #Button1,#Button2,#Button3,#Button4,#Button5,#Log_In{
             background:transparent ;
             padding:10px 20px 10px 20px;
             color:yellow;
             border-radius: 25px!important;
        }
        #Button1:hover,#Button2:hover,#Button3:hover,#Button4:hover,#Button5:hover{
             font-weight:bolder !important;
             background-color:antiquewhite;
             color:blueviolet;
}
        #Log_In:hover{
            font-weight:bolder !important;
            background-color:lawngreen;
            color:black;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <section class="dark">
        <nav>
    <img alt="GMIT Logo" class="auto-style2" src="Images/gmit_logo.png" />
    <h2 class="title">GARGI MEMORIAL INSTITUTE OF TECHNOLOGY (ESTD: 2011)</h2>
    <img alt="JiS Logo" class="auto-style2" src="Images/JiS_logo.png" role="img" />
     
        
        <div class="menu">
            <div class="menu-button">
        <asp:Button ID="Button1" runat="server" Text=" HOME" PostBackUrl="~/index.aspx#Home" BorderWidth="0px" />
    
        <asp:Button ID="Button2" runat="server" Text=" ADMISSION" PostBackUrl="~/index.aspx#Admission" BorderWidth="0px"/>
    
        <asp:Button ID="Button3" runat="server" Text=" DASHBOARD" PostBackUrl="~/dashboard.aspx" BorderWidth="0px" />
    
        <asp:Button ID="Button4" runat="server" Text=" NOTICEBOARD" PostBackUrl="~/index.aspx#Notice" BorderWidth="0px" />
    
        <asp:Button ID="Button5" runat="server" Text=" PLACEMENT" PostBackUrl="~/index.aspx#Placement"  BorderWidth="0px" />
    </div>
            <div class="menu-end">
    
        <asp:Button ID="Log_In" runat="server" Text="LOG_IN" PostBackUrl="~/login.aspx" BorderWidth="0px" />
    </div>
</div>
</nav>
        </section>
        <section class="dark">
            <div class="auto-style34">
    <img src="Images/WhatsApp1.jpg" class="auto-style10" id="Home" alt="Image Description"/>
    <div class="overlay-text">
        <h3 style="color:darkorange; font-weight:bolder; background:transparent;">GMIT Kolkata: </h3><h3 style="color:black; font-weight:bolder; background:transparent;">Top Private BTech College</h3><br /><br />
Gargi Memorial Institute of Technology (GMIT) is a pioneer in engineering education, marking 13 successful years since its establishment in 2011 in Baruipur, Kolkata. Approved by the All India Council for Technical Education (AICTE) and affiliated with Maulana Abul Kalam Azad University of Technology (MAKAUT), formerly known as West Bengal University of Technology (WBUT).
        <br /><br />
The institute's achievements include being ranked eighth among the "Best Emerging Engineering Colleges in India" in 2017, and the number one "Best Emerging Engineering College in West Bengal" by Times Engineering for four consecutive years (2016-2019). In 2020, Zee 24 Ghanta honored GMIT with the "Best Emerging and Promising Engineering College Award".
        <br /><br />
In 2019, GMIT joined hands with JIS Group, the largest educational initiative in Eastern India, benefiting from their 25 years of experience. This partnership has propelled GMIT towards excellence and garnered attention from Fortune 500 companies for recruitment. 
   <br /> </div>
</div>
    </section>
        
        <section class="light">
            <table cellpadding="0" cellspacing="15" class="auto-style12" align="center">
    <tr>
        <td id="Notice" class="auto-style32">
            <h2 class="auto-style22">NOTICEBOARD</h2>
            <div>
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" BackColor="#6699FF" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="100%">
                    <AlternatingRowStyle BackColor="White"/>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbcol %>" SelectCommand="SELECT [Notice] FROM [notice]"></asp:SqlDataSource>
            </div>
        </td>

        <td id="Admission" class="auto-style32">
            <h2 class="auto-style15">COURSES AVAILABLE IN OUR COLLEGE</h2>
            <div class="auto-style16">
                <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource2" CssClass="auto-style14" CellSpacing="2" Width="100%">
                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" ForeColor="#003399" />
                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SortedAscendingCellStyle BackColor="#EDF6F6" />
                    <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                    <SortedDescendingCellStyle BackColor="#D6DFDF" />
                    <SortedDescendingHeaderStyle BackColor="#002876" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbcol %>" SelectCommand="SELECT [Name], [Branch], [Course Fee] AS Course_Fee, [Duration], [Seats Left] AS Seats_Left FROM [Courses]"></asp:SqlDataSource>
            </div>
                
                    <br />
                <a href="admission.aspx">CLICK HERE FOR ADMISSION</a>
        </td>
    </tr>
    <tr>
        <td id="Event" class="auto-style33">
            <div class="auto-style25">
                <asp:GridView ID="GridView3" runat="server" BorderWidth="0" DataSourceID="SqlDataSource3" Width="100%" Height="222px">
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:dbcol %>" SelectCommand="SELECT [UpcomingEvents], [PastEvents] FROM [events]"></asp:SqlDataSource>
            </div>
        </td>

        <td id="About" class="auto-style33">&nbsp;
          <div class="info-container">
    <p class="scholarship">
        <span class="highlight">Scholarship Available:</span> SVMCM, OASIS, and many more.
    </p>
    <p class="student-credit-card">
        <span class="highlight">Student Credit Card:</span> Also availed under the scheme of the West Bengal government.
    </p>
</div>
        </td>
    </tr>
</table>
        </section>
        <section class="dark">
            <section class="slider-container" id="Gallery">
    <section class="slider">
        <div class="slide one">
            <span class="caption"> #campus life </span>
        </div>
        <div class="slide two" style="left: 0px; top: 0px">
            <span class="caption"> #campus life </span>
        </div>
        <div class="slide three">
            <span class="caption"> #campus life </span>
        </div>
        <div class="slide four">
            <span class="caption"> #campus life </span>
        </div>
    </section>
        </section>
        </section>
                <section class="light">
            <div class="auto-style27" id="Placement">
    <span>OUR PLACEMENT PARTNERS</span>
</div>
<div class="brands-container">
    <div class="brands-track">
        <div class="brand"><img src="Images/adobe.png" alt="Brand 1"></div>
        <div class="brand"><img src="Images/apple.jpeg" alt="Brand 2"></div>
        <div class="brand"><img src="Images/cisco.png" alt="Brand 3"></div>
        <div class="brand"><img src="Images/dell.png" alt="Brand 4"></div>
        <div class="brand"><img src="Images/ford.jpeg" alt="Brand 5"></div>
        <div class="brand"><img src="Images/ibm.png" alt="Brand 6"></div>
        <div class="brand"><img src="Images/lg.png" alt="Brand 7"></div>
        <div class="brand"><img src="Images/loreal.png" alt="Brand 8"></div>
        <div class="brand"><img src="Images/mahindra.jpeg" alt="Brand 9"></div>
        <div class="brand"><img src="Images/provogue.png" alt="Brand 10"></div>
        <div class="brand"><img src="Images/reliance.jpeg" alt="Brand 11"></div>
        <div class="brand"><img src="Images/sony.jpeg" alt="Brand 12"></div>
        <div class="brand"><img src="Images/tata.png" alt="Brand 13"></div>
        <div class="brand"><img src="Images/volkswagen.jpeg" alt="Brand 14"></div>
        <div class="brand"><img src="Images/adobe.png" alt="Brand 1"></div>
        <div class="brand"><img src="Images/apple.jpeg" alt="Brand 2"></div>
        <div class="brand"><img src="Images/cisco.png" alt="Brand 3"></div>
        <div class="brand"><img src="Images/dell.png" alt="Brand 4"></div>
        <div class="brand"><img src="Images/ford.jpeg" alt="Brand 5"></div>
        <div class="brand"><img src="Images/ibm.png" alt="Brand 6"></div>
        <div class="brand"><img src="Images/lg.png" alt="Brand 7"></div>
        <div class="brand"><img src="Images/loreal.png" alt="Brand 8"></div>
        <div class="brand"><img src="Images/mahindra.jpeg" alt="Brand 9"></div>
        <div class="brand"><img src="Images/provogue.png" alt="Brand 10"></div>
        <div class="brand"><img src="Images/reliance.jpeg" alt="Brand 11"></div>
        <div class="brand"><img src="Images/sony.jpeg" alt="Brand 12"></div>
        <div class="brand"><img src="Images/tata.png" alt="Brand 13"></div>
        <div class="brand"><img src="Images/volkswagen.jpeg" alt="Brand 14"></div>
    </div>
</div>
        </section>
        <section class="dark">
                        <div class="auto-style27" id="placement">
    <span>OUR ALUMNI OUR PRIDE</span>
</div>
            <div class="professors-container">
  
                                <div class="professor-card">
  <img src="Images/thor.jpg" alt="Professor 1" class="professor-image">
  <div class="professor-info">
    <h3>Thor Odinson</h3>
    <p>Specialist in Data Science and Machine Learning</p>
  </div>
</div>
                                <div class="professor-card">
  <img src="Images/steve.jpg" alt="Professor 2" class="professor-image">
  <div class="professor-info">
    <h3>Steve Rogers</h3>
    <p>Specialist in Data Science and Machine Learning</p>
  </div>
</div>

  <div class="professor-card">
    <img src="Images/carol.jpg" alt="Professor 3" class="professor-image">
    <div class="professor-info">
      <h3>Carol Danvers</h3>
      <p>Specialist in Data Science and Machine Learning</p>
    </div>
  </div>
               
                <div class="professor-card">
  <img src="Images/stark.jpg" alt="Professor 4" class="professor-image">
  <div class="professor-info">
    <h3>Tony Stark</h3>
    <p>Expert in Computer Science and Artificial Intelligence</p>
  </div>
</div>

<div class="professor-card">
  <img src="Images/wanda.jpg" alt="Professor 5" class="professor-image">
  <div class="professor-info">
    <h3>Wanda Maximoff</h3>
    <p>Researcher in Software Engineering and Systems Design</p>
  </div>
</div>

<div class="professor-card">
  <img src="Images/natasha.jpeg" alt="Professor 6" class="professor-image">
  <div class="professor-info">
    <h3>Natasha Romanoff</h3>
    <p>Specialist in Data Science and Machine Learning</p>
  </div>
</div>
                <div class="professor-card">
  <img src="Images/peter.jpg" alt="Professor 7" class="professor-image">
  <div class="professor-info">
    <h3>Peter Parker</h3>
    <p>Specialist in Data Science and Machine Learning</p>
  </div>
</div>
                <div class="professor-card">
  <img src="Images/loki.jpg" alt="Professor 8" class="professor-image">
  <div class="professor-info">
    <h3>Loki Odinson</h3>
    <p>Specialist in Data Science and Machine Learning</p>
  </div>
</div>
               
                <div class="professor-card">
  <img src="Images/logan.jpg" alt="Professor 9" class="professor-image">
  <div class="professor-info">
    <h3>Logan</h3>
    <p>Specialist in Data Science and Machine Learning</p>
  </div>
</div>

  <!-- Add more professor cards as needed -->
</div>

        </section>
        <section class="light">
            <footer class="footer">
    <div class="footer-content">
        <div class="footer-section address">
            <h4>Address</h4>
            <p>Balarampur, Mouza Beralia,<br>Baruipur, Kolkata - 700144<br>West Bengal</p>
        </div>
        <div class="footer-section contact">
            <h4>Contact</h4>
            <p>Email: <a href="mailto:marketing_gmit@jisgroup.org">marketing_gmit@jisgroup.org</a></p>
            <p>Phone: +91- 83369 42309<br />&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp+91- 83369 42300</p>
        </div>
        <div class="footer-section social">
            <h4>Follow Us</h4>
            <p><a href="#">Facebook</a> | <a href="#">Twitter</a> | <a href="#">LinkedIn</a></p>
        </div>
    </div>
    <div class="footer-bottom">
        <p>&copy; 2024 RK_GRYLLS. All rights reserved.</p>
    </div>
</footer>

        </section>
    </form>
</body>
</html>