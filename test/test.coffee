should = require 'should'
ho = require '../'

Error.stackTraceLimit = Infinity

it 'should pass baseline tests', ->
	c = 0xc0
	for i in [2..8]
		c |= 1 << (8 - i)
		(ho c).should.equal i

it 'should return 1 for ascii characters', ->
	for i in [0...0x80]
		(ho i).should.equal 1

it 'should return 0 for continuation characters', ->
	for i in [0...0x3f]
		c = i | 0x80
		(ho c).should.equal 0

it 'should correctly identify 2 bytes', ->
	for i in [0...0x1f]
		c = i | 0xC0
		(ho c).should.equal 2

it 'should correctly identify 3 bytes', ->
	for i in [0...0x0f]
		c = i | 0xE0
		(ho c).should.equal 3

it 'should correctly identify 4 bytes', ->
	for i in [0...0x07]
		c = i | 0xF0
		(ho c).should.equal 4

it 'should correctly identify 5 bytes', ->
	for i in [0...0x03]
		c = i | 0xF8
		(ho c).should.equal 5

it 'should correctly identify 6 bytes', ->
	for i in [0, 1]
		c = i | 0xFC
		(ho c).should.equal 6

it 'should correctly identify 7 bytes', ->
	(ho 0xFE).should.equal 7

it 'should correctly identify 8 bytes', ->
	(ho 0xFF).should.equal 8

it 'should correctly identify the alphabet as 1\'s', ->
	for c in 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789~!@#$%^&*()_+<>?,./\'":;\\|]}[{\r\n'
		(ho c.charCodeAt 0).should.equal 1

hbyte = (chr)-> (Buffer(chr, 'utf8'))[0]

it 'should correctly identify emojis as 4 bytes long', ->
	for c in Buffer('🦄🎉🌈💩😘👽👬') by 4
		(ho c).should.equal 4

it 'should correctly identify chinese characters as 3 bytes long', ->
	for chr in '哇我喜欢弹跳在木星周围熊猫让我们喝醉了做那个'
		(ho hbyte chr).should.equal 3
