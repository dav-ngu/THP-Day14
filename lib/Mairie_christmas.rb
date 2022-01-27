require 'nokogiri'
require 'open-uri'

def get_avernes_email
page_avernes = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/95/avernes.html"))
avernes_mail = page_avernes.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
puts avernes_mail.text
end

def get_name_city
tab_1 = []
page_ville = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))
noms_ville = page_ville.xpath('//*[@class="lientxt"]')
noms_ville.each do |i|
tab_1.push(i.text)
end
print tab_1
end

get_name_city
puts ""
puts ""
def get_url
    tab_2 = []
    page_ville = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))
    url_ville = page_ville.xpath('//*[@class="lientxt"]/@href')
    url_ville.each do |i|
    tab_2.push("http://annuaire-des-mairies.com#{i.text[1..-1]}") #[1..-1] permet de supprimer le premier caractère
    end
    puts tab_2
end

get_url
puts ""
puts ""

def perform(name)
    tab_3=[]
    name = ["ABLEIGES", "AINCOURT", "AMBLEVILLE", "AMENUCOURT", "ANDILLY", "ARGENTEUIL", "ARNOUVILLE LES GONESSE", "ARRONVILLE", "ARTHIES", "ASNIERES SUR OISE", "ATTAINVILLE", "AUVERS SUR OISE", "AVERNES", "BAILLET EN FRANCE", "BANTHELU", "BEAUCHAMP", "BEAUMONT SUR OISE", "BELLEFONTAINE", "BELLOY EN FRANCE", "BERNES SUR OISE", "BERVILLE", "BESSANCOURT", "BETHEMONT LA FORET", "BEZONS", "BOISEMONT", "BOISSY L AILLERIE", "BONNEUIL EN FRANCE", "BOUFFEMONT", "BOUQUEVAL", "BRAY ET LU", "BREANCON", "BRIGNANCOURT", "BRUYERES SUR OISE", "BUHY", "BUTRY SUR OISE", "CERGY", "CHAMPAGNE SUR OISE", 
"CHARMONT", "CHARS", "CHATENAY EN FRANCE", "CHAUMONTEL", "CHAUSSY", "CHAUVRY", "CHENNEVIERES LES LOUVRES", "CHERENCE", "CLERY EN VEXIN", "COMMENY", "CONDECOURT", "CORMEILLES EN PARISIS", "CORMEILLES EN VEXIN", "COURCELLES SUR VIOSNE", "COURDIMANCHE", "DEUIL LA BARRE", "DOMONT", "EAUBONNE", "ECOUEN", "ENGHIEN LES BAINS", "ENNERY", "EPIAIS LES LOUVRES", "EPIAIS RHUS", "EPINAY CHAMPLATREUX", "ERAGNY SUR OISE", "ERMONT", "EZANVILLE", "FONTENAY EN PARISIS", "FOSSES", "FRANCONVILLE", "FREMAINVILLE", "FREMECOURT", "FREPILLON", "FROUVILLE", "GADANCOURT", "GARGES LES GONESSE", "GENAINVILLE", "GENICOURT", "GONESSE", "GOUSSAINVILLE", "GOUZANGREZ", "GRISY LES PLATRES", "GROSLAY", "GUIRY EN VEXIN", "HARAVILLIERS", "HAUTE ISLE", "HEDOUVILLE", "HERBLAY", "HEROUVILLE", "HODENT", "JAGNY SOUS BOIS", "JOUY LE MOUTIER", 
"LABBEVILLE", "LA CHAPELLE EN VEXIN", "LA FRETTE SUR SEINE", "LA ROCHE GUYON", "LASSY", "LE BELLAY EN VEXIN", "LE HEAULME", "LE MESNIL AUBRY", "LE PERCHAY", "LE PLESSIS BOUCHARD", "LE PLESSIS GASSOT", "LE PLESSIS LUZARCHES", "LE THILLAY", "L ISLE ADAM", "LIVILLIERS", "LONGUESSE", "LOUVRES", "LUZARCHES", "MAFFLIERS", "MAGNY EN VEXIN", "MAREIL EN FRANCE", "MARGENCY", "MARINES", "MARLY LA VILLE", "MAUDETOUR EN VEXIN", "MENOUVILLE", "MENUCOURT", "MERIEL", "MERY SUR OISE", "MOISSELLES", "MONTGEROULT", "MONTIGNY LES CORMEILLES", "MONTLIGNON", "MONTMAGNY", "MONTMORENCY", "MONTREUIL SUR EPTE", "MONTSOULT", "MOURS", "MOUSSY", "NERVILLE LA FORET", "NESLES LA VALLEE", "NEUILLY EN VEXIN", "NEUVILLE 
SUR OISE", "NOINTEL", "NOISY SUR OISE", "NUCOURT", "OMERVILLE", "OSNY", "PARMAIN", "PERSAN", "PIERRELAYE", "PISCOP", "PONTOISE", "PRESLES", "PUISEUX EN FRANCE", "PUISEUX PONTOISE", "ROISSY EN FRANCE", "RONQUEROLLES", "SAGY", "SAINT 
BRICE SOUS FORET", "SAINT CLAIR SUR EPTE", "SAINT CYR EN ARTHIES", "SAINT GERVAIS", "SAINT GRATIEN", "SAINT LEU LA FORET", "SAINT MARTIN DU TERTRE", "SAINT OUEN L AUMONE", "SAINT PRIX", "SAINT WITZ", "SANNOIS", "SANTEUIL", "SARCELLES", "SERAINCOURT", "SEUGY", "SOISY SOUS MONTMORENCY", "SURVILLIERS", "TAVERNY", "THEMERICOURT", "THEUVILLE", "US", "VALLANGOUJARD", "VALMONDOIS", "VAUDHERLAND", "VAUREAL", "VEMARS", "VETHEUIL", "VIARMES", "VIENNE EN ARTHIES", "VIGNY", "VILLAINES SOUS BOIS", "VILLERON", "VILLERS EN ARTHIES", "VILLIERS ADAM", "VILLIERS LE BEL", "VILLIERS LE SEC", "WY DIT JOLI VILLAGE"]
    for n in 0...name.length
    page_url_ville = "https://www.annuaire-des-mairies.com/95/#{name[n]}.html"
    ville_page = Nokogiri::HTML(URI.open(page_url_ville))
    begin
    tab_3.push(ville_page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]'))
    rescue=>e
    end
    puts tab_3
end

perform
end






