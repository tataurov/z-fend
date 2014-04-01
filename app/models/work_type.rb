# coding: utf-8

class WorkType < ActiveRecord::Base
  has_and_belongs_to_many :works

  validates :name, presence: { message: "Поле не может быть пустым" }
end
