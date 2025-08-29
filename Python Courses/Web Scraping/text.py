from bs4 import BeautifulSoup
from requests_html import HTMLSession

url = 'https://react-amazon-bestsellers-books-dy.netlify.app/'

from requests_html import HTMLSession

session = HTMLSession()
response = session.get(url)
response.html.render()
resp=response.html.raw_html

print(response.status_code)
# print(response.html.html)
# print(response.html.find('article.book'))

soup = BeautifulSoup(response.html.html, 'html.parser')
books = soup.find_all('article', class_= 'book')

for book in books:
  print(book.find('h2').text)



# =========================================================
# from selenium import webdriver
# from selenium.webdriver.common.by import By
# import time

# driver = webdriver.Edge()

# driver.get('https://bing.com')

# element = driver.find_element(By.ID, 'sb_form_q')
# element.send_keys('WebDriver')
# element.submit()

# time.sleep(5)
# driver.quit()