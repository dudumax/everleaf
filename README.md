# README

| Model | Table | column name | data type   |
|:-----:|:-----:|:-----------:|-------------|
|  User | users |     name    | string      |
|       |       |     email   | string      |
|       |       |             |             |


| Model | Table | Column Name | Data type |
|-------|-------|-------------|-----------|
| Task  | Tasks | Inquiry     | string    |
|       |       | title       | string    |
|       |       |             |           |



| Model | Table  | Column Name | Data type |
|-------|--------|-------------|-----------|
| Label | labels | label1_ID   | string    |
|       |        | label2_ID   | string    |
|       |        |             |           |


# How to deploy to heroku#
#install heroku  (sudo snap install --classic heroku)
#git init
#heroku login --interactive
#heroku create 
#git push heroku master