library(blastula)
# Get a nicely formatted date/time string
date_time <- add_readable_time()

# Create an image string using an on-disk
# image file
img_file_path <-
  system.file(
    "img", "pexels-photo-267151.jpeg",
    package = "blastula"
  )

img_string <- add_image(file = img_file_path)

email <-
  compose_email(
    body = md(
      c(
        "Hello Amol,

This Mail is from Rstudio. Created by Mahesh Kulkarni.
I am working on this module.I create one script which sends a 
Mail. So the first task is can we sent a mail from project ?
Ans: Yes
"
      )
    ),
    footer = md(
      c(
        "Email sent on ", date_time, "."
      )
    )
  )

# shejawalamola@johndeere.com

creds(user = NULL, provider = NULL, host = NULL, port = NULL, use_ssl = TRUE)

create_smtp_creds_file(file = "email_creds",
                       user = "kulkarnimahesh@johndeere.com",
                       provider = "office365",
                       host = "smtps://outlook.office365.com.office.johndeere.myshn.net/mapi/emsmdb/?MailboxId=829b695b-ed9a-4905-9d6a-c7e7f9c0fb8a@johndeere.com",
                       port = 465,
                       use_ssl = TRUE)

# Sending email by SMTP using a credentials file
email %>%
  smtp_send(
    to = "malirohit@johndeere.com",
    from = "kulkarnimahesh@johndeere.com",
    subject = "This Mail From Rstudio Mahesh's Project",
    credentials = creds_file("email_creds")
  )
