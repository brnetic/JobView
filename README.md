# JobView

## Application for filtering Emails and displaying job application status data
An application that makes displaying all of your job applications easier. It syncs up with your email, reads your emails, and determines if it is job application-related. If it is job application-related, it stores it in a database. The information from the database gets retrieved and displayed on an iOS app that says the company you applied for, the role you applied for, the status of the application, and a date.

### Python Backend
Wrote a backend in Python for all of the under-the-hood operations. I connected to the imaplib server with my credentials and read emails from the past day. I then extracted the subject and the body of the emails and sent them to the OpenAi API. If OpenAI returns the data, then it stores the data in Firebase Firestore. I also deployed this code to Firebase Functions to make it run on a cloud, and I scheduled it to run every day.


### Open API GPT Model for processing emails
I used OpenAi's API gpt-4o model where I passed him this prompt to give me information about email: "I will give you an email inside triple backticks. Determine if it is a job application, interview invitation, or job application denial. If it is one of these, return only a JSON object(using only curly braces and no extra text!!!!) with the following keys: company, date, status, and role. For 'date,' use the email's date or 'None' if not present; for 'status,' return 'pending' for a job application, 'accepted' for an invitation, and 'rejected' for denial, for role return a specified role this email is referring to if it is not specified return 'None.' If the email is not job-related, return 'None.' Do not add any extra text.'''{email_str}'''".

### Frontend in Swift for displaying data

I used SWiftUi to display the data saved in Firestore about jobs related to a currently logged-in user (which is currently only me). I displayed the company name, role, status, and date related to the email.

![image](https://github.com/user-attachments/assets/b9da7f06-83fa-4439-a0d3-ee938d29b6f1)

