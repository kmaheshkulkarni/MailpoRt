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

file = "EmailModule.pptx"
# ppt_path<- system.file(
#   "Email_Module.pptx", package = "blastula"
# )
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
",
img_string
      )
    ),
    footer = md(
      c(
        "Email sent on ", date_time, "."
      )
    )
  )

attach<- add_attachment(
  email = email,
  file = file,
  content_type = mime::guess_type(file),
  filename = basename(file)
)
# shejawalamola@johndeere.com

# creds(user = NULL, provider = NULL, host = NULL, port = NULL, use_ssl = TRUE)

create_smtp_creds_file(file = "email_creds",
                       user = "vmk80555@outlook.com",
                       provider = "office365",
                       host = "smtp.office365.com",
                       port = 587,
                       use_ssl = TRUE)

# smtp <- create_smtp_creds_key(
#   id = "outlook",
#   user = "kulkarnimahesh@johndeere.com",
#   provider = "office365",
#   host = "smtp.office365.com",
#   use_ssl = TRUE)

# Sending email by SMTP using a credentials file
attach %>%
  smtp_send(
    to = "amol.shejawal@gmail.com",
    from = "vmk80555@outlook.com",
    subject = "This Mail From Rstudio Mahesh's Project",
    credentials = creds_file("email_creds")
  )
