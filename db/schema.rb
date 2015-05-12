# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150512030246) do

  create_table "bolaos", force: :cascade do |t|
    t.string   "arquivo_file_name"
    t.string   "arquivo_content_type"
    t.integer  "arquivo_file_size"
    t.datetime "arquivo_updated_at"
  end

  create_table "loteria", force: :cascade do |t|
    t.string  "nome"
    t.string  "sigla"
    t.integer "qtd_min_dezenas"
    t.integer "qtd_max_dezenas"
    t.integer "min_soma"
    t.integer "max_soma"
    t.integer "max_pares"
    t.integer "min_pares"
    t.integer "max_impares"
    t.integer "min_impares"
    t.integer "min_mais_sorteados"
    t.integer "max_mais_sorteados"
    t.integer "min_menos_sorteados"
    t.integer "max_menos_sorteados"
    t.integer "min_colunas_cheias"
    t.integer "max_colunas_cheias"
    t.integer "min_linhas_cheias"
    t.integer "max_linhas_cheias"
    t.integer "min_colunas_vazias"
    t.integer "max_colunas_vazias"
    t.integer "min_linhas_vazias"
    t.integer "max_linhas_vazias"
    t.integer "min_coluna_esquerda_direita"
    t.integer "min_digitos"
    t.integer "max_digitos"
    t.integer "max_fibonacci"
    t.integer "min_fibonacci"
    t.integer "max_numeros_primos"
    t.integer "min_numeros_primos"
    t.integer "max_numeros_consecutivos"
    t.integer "min_quadrantes"
    t.text    "linhas"
    t.text    "colunas"
    t.text    "quadrantes"
    t.string  "menos_sorteados"
    t.string  "mais_sorteados"
    t.string  "multiplos"
    t.string  "fibonacci"
    t.string  "numeros_primos"
  end

  create_table "palpites", force: :cascade do |t|
    t.integer "bolao_id"
    t.string  "dezenas"
    t.integer "pontos"
    t.boolean "teste_soma"
    t.boolean "teste_pares_impares"
    t.boolean "teste_mais_sorteados"
    t.boolean "teste_menos_sorteados"
    t.boolean "teste_colunas_cheias"
    t.boolean "teste_colunas_vazias"
    t.boolean "teste_linhas_vazias"
    t.boolean "teste_linhas_cheias"
    t.boolean "teste_fibonacci"
    t.boolean "teste_numeros_primos"
    t.boolean "teste_numeros_consecutivos"
    t.boolean "teste_quadrantes"
  end

end
