class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'いぬ' },
    { id: 3, name: 'ねこ' },
    { id: 4, name: 'とり' },
    { id: 5, name: 'うさぎ' },
    { id: 6, name: 'ハムスター' },
    { id: 7, name: '哺乳類' },
    { id: 8, name: '魚' },
    { id: 9, name: 'むし' },
    { id: 10, name: '爬虫類' },
    { id: 11, name: '両生類' },
    { id: 12, name: '植物' },
    { id: 13, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :albums
  end