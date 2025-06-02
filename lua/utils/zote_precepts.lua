local M = {}

-- Lista de preceitos em português
M.precepts_pt = {
  "Preceito Um: 'Sempre Vença Suas Batalhas' - Perder uma batalha não lhe ensina nada e não lhe dá nada. Vença suas batalhas, ou não as enfrente!",
  "Preceito Dois: 'Nunca Deixe Que Riam de Você' - Tolos riem de tudo, até mesmo de seus superiores. Mas cuidado, o riso não é inofensivo! O riso se espalha como uma doença, e logo todos estarão rindo de você. Você precisa atacar a fonte dessa alegria perversa rapidamente para impedi-la de se espalhar.",
  "Preceito Três: 'Esteja Sempre Descansado' - Lutar e aventurar-se cobram seu preço do seu corpo. Quando você descansa, seu corpo se fortalece e se repara. Quanto mais você descansa, mais forte se torna.",
  "Preceito Quatro: 'Esqueça Seu Passado' - O passado é doloroso, e pensar sobre seu passado só pode lhe trazer miséria. Pense em outra coisa, como o futuro, ou comida.",
  "Preceito Cinco: 'Força Vence Força' - Seu oponente é forte? Não importa! Simplesmente supere a força dele com ainda mais força, e logo ele será derrotado.",
  "Preceito Seis: 'Escolha Seu Próprio Destino' - Nossos anciãos ensinam que nosso destino é escolhido antes mesmo de nascermos. Eu discordo.",
  "Preceito Sete: 'Não Lamente os Mortos' - Quando morremos, as coisas ficam melhores ou piores? Não há como saber, então não devemos nos preocupar em lamentar. Ou celebrar, aliás.",
  "Preceito Oito: 'Viaje Sozinho' - Você não pode confiar em ninguém, e ninguém será sempre leal. Portanto, ninguém deve ser seu companheiro constante.",
  "Preceito Nove: 'Mantenha Sua Casa Arrumada' - Sua casa é onde você guarda sua posse mais valiosa - você mesmo. Portanto, você deve se esforçar para mantê-la limpa e organizada.",
  "Preceito Dez: 'Mantenha Sua Arma Afiada' - Eu me certifico de que minha arma, 'Fim da Vida', esteja sempre bem afiada. Isso torna muito mais fácil cortar as coisas.",
  "Preceito Onze: 'Mães Sempre Irão Trair Você' - Este preceito se explica por si só.",
  "Preceito Doze: 'Mantenha Sua Capa Seca' - Se sua capa ficar molhada, seque-a o mais rápido possível. Usar capas molhadas é desagradável e pode levar a doenças.",
  "Preceito Treze: 'Nunca Tenha Medo' - O medo só pode te segurar. Enfrentar seus medos pode ser um tremendo esforço. Portanto, você simplesmente não deve ter medo desde o início.",
  "Preceito Quatorze: 'Respeite Seus Superiores' - Se alguém é seu superior em força ou intelecto ou ambos, você precisa mostrar respeito. Não os ignore ou ria deles.",
  "Preceito Quinze: 'Um Golpe, Um Inimigo' - Você só deve usar um único golpe para derrotar um inimigo. Qualquer coisa a mais é desperdício. Além disso, contando seus golpes enquanto luta, você saberá quantos inimigos derrotou.",
  "Preceito Dezesseis: 'Não Hesite' - Uma vez que você tomou uma decisão, execute-a e não olhe para trás. Você alcançará muito mais dessa maneira.",
  "Preceito Dezessete: 'Acredite Em Sua Força' - Outros podem duvidar de você, mas há alguém em quem você sempre pode confiar. Você mesmo. Certifique-se de acreditar em sua própria força, e você nunca fraquejará.",
  "Preceito Dezoito: 'Busque a Verdade na Escuridão' - Este preceito também se explica por si só.",
  "Preceito Dezenove: 'Se Tentar, Tenha Sucesso' - Se você vai tentar algo, certifique-se de conseguir. Se você não tiver sucesso, então você realmente falhou! Evite isso a todo custo.",
  "Preceito Vinte: 'Fale Apenas a Verdade' - Ao falar com alguém, é cortês e também eficiente falar a verdade. Mas cuidado, falar a verdade pode fazer inimigos. Isso é algo que você terá que suportar.",
  "Preceito Vinte e Um: 'Esteja Ciente de Seus Arredores' - Não fique apenas andando olhando para o chão! Você precisa olhar para cima de vez em quando, para ter certeza de que nada o pegue de surpresa.",
  "Preceito Vinte e Dois: 'Abandone o Ninho' - Assim que pude, deixei meu local de nascimento e segui meu caminho pelo mundo. Não permaneça no ninho. Não há nada para você lá.",
  "Preceito Vinte e Três: 'Identifique o Ponto Fraco do Inimigo' - Todo inimigo que você encontra tem um ponto fraco, como uma rachadura em sua casca ou estar dormindo. Você deve estar constantemente alerta e examinando seu inimigo para detectar sua fraqueza!",
  "Preceito Vinte e Quatro: 'Ataque o Ponto Fraco do Inimigo' - Uma vez que você identificou o ponto fraco do seu inimigo conforme o preceito anterior, ataque-o. Isso o destruirá instantaneamente.",
  "Preceito Vinte e Cinco: 'Proteja Seu Próprio Ponto Fraco' - Esteja ciente de que seu inimigo tentará identificar seu ponto fraco, então você deve protegê-lo. A melhor proteção? Nunca ter um ponto fraco em primeiro lugar.",
  "Preceito Vinte e Seis: 'Não Confie em Seu Reflexo' - Ao olhar para certas superfícies brilhantes, você pode ver uma cópia de seu próprio rosto. O rosto imitará seus movimentos e parece semelhante ao seu, mas não acho que se possa confiar nele.",
  "Preceito Vinte e Sete: 'Coma o Máximo Que Puder' - Ao fazer uma refeição, coma o máximo possível. Isso lhe dá energia extra e significa que você pode comer com menos frequência.",
  "Preceito Vinte e Oito: 'Não Olhe Fixamente Para a Escuridão' - Se você olhar fixamente para a escuridão e não conseguir ver nada por muito tempo, sua mente começará a se demorar em memórias antigas. Memórias devem ser evitadas, conforme o Preceito Quatro.",
  "Preceito Vinte e Nove: 'Desenvolva Seu Senso de Direção' - É fácil se perder ao viajar por cavernas sinuosas e tortuosas. Ter um bom senso de direção é como ter um mapa mágico dentro de sua cabeça. Muito útil.",
  "Preceito Trinta: 'Nunca Aceite uma Promessa' - Rejeite as promessas dos outros, pois elas são sempre quebradas. Promessas de amor ou noivado devem ser especialmente evitadas.",
  "Preceito Trinta e Um: 'A Doença Vive na Sujeira' - Você ficará doente se passar muito tempo em lugares sujos. Se você estiver hospedado na casa de alguém, exija o mais alto nível de limpeza do seu anfitrião.",
  "Preceito Trinta e Dois: 'Nomes Têm Poder' - Nomes têm poder, e portanto nomear algo é conceder-lhe poder. Eu mesmo nomeei minha agulha de 'Fim da Vida'. Não roube o nome que eu inventei! Invente o seu próprio!",
  "Preceito Trinta e Três: 'Não Mostre Respeito ao Inimigo' - Ser galante com seus inimigos não é virtude! Se alguém se opõe a você, eles não merecem respeito, bondade ou misericórdia.",
  "Preceito Trinta e Quatro: 'Não Coma Imediatamente Antes de Dormir' - Isso pode causar inquietação e indigestão. É apenas bom senso.",
  "Preceito Trinta e Cinco: 'Para Cima é Para Cima, Para Baixo é Para Baixo' - Se você cair na escuridão, pode ser fácil perder o equilíbrio e esquecer qual direção é para cima. Mantenha este preceito em mente!",
  "Preceito Trinta e Seis: 'Cascas de Ovo são Frágeis' - Mais uma vez, este preceito se explica por si só.",
  "Preceito Trinta e Sete: 'Pegue Emprestado, Mas Não Empreste' - Se você empresta e é reembolsado, você não ganha nada. Se você pega emprestado mas não paga, você ganha tudo.",
  "Preceito Trinta e Oito: 'Cuidado com a Força Misteriosa' - Uma força misteriosa nos pressiona de cima, empurrando-nos para baixo. Se você passar muito tempo no ar, a força o esmagará contra o chão e o destruirá. Cuidado!",
  "Preceito Trinta e Nove: 'Coma Rápido e Beba Devagar' - Seu corpo é uma coisa delicada e você deve alimentá-lo com grande deliberação. A comida deve entrar o mais rápido possível, mas os líquidos em um ritmo mais lento.",
  "Preceito Quarenta: 'Não Obedeça a Nenhuma Lei Além da Sua' - Leis escritas por outros podem incomodá-lo ou ser um fardo. Deixe que seus próprios desejos sejam a única lei.",
  "Preceito Quarenta e Um: 'Aprenda a Detectar Mentiras' - Quando outros falam, geralmente mentem. Examine-os e questione-os implacavelmente até que revelem seu engano.",
  "Preceito Quarenta e Dois: 'Gaste Geo Quando Você Tiver' - Alguns se agarram ao seu Geo, até levando-o para a terra quando morrem. É melhor gastá-lo quando puder, para que você possa desfrutar de várias coisas na vida.",
  "Preceito Quarenta e Três: 'Nunca Perdoe' - Se alguém pedir seu perdão, por exemplo um irmão seu, sempre negue. Esse irmão, ou quem quer que seja, não merece tal coisa.",
  "Preceito Quarenta e Quatro: 'Você Não Pode Respirar Água' - A água é refrescante, mas se você tentar respirá-la, você terá uma desagradável surpresa.",
  "Preceito Quarenta e Cinco: 'Uma Coisa Não é Outra' - Este deveria ser óbvio, mas já tive outros tentando argumentar que uma coisa, que é claramente o que é e não outra coisa, é na verdade alguma outra coisa, que não é. Fique em guarda!",
  "Preceito Quarenta e Seis: 'O Mundo é Menor do Que Você Pensa' - Quando jovem, você tende a pensar que o mundo é vasto, enorme, gigantesco. É natural. Infelizmente, ele é na verdade bem menor que isso. Posso dizer isso, agora tendo viajado por toda a terra.",
  "Preceito Quarenta e Sete: 'Faça Sua Própria Arma' - Só você sabe exatamente o que é necessário em sua arma. Eu mesmo forjei 'Fim da Vida' de madeira de concha quando jovem. Nunca me falhou. Nem eu a ela.",
  "Preceito Quarenta e Oito: 'Tenha Cuidado Com o Fogo' - Fogo é um tipo de espírito quente que dança imprudentemente. Pode aquecê-lo e fornecer luz, mas também queimará sua casca se chegar muito perto.",
  "Preceito Quarenta e Nove: 'Estátuas são Sem Sentido' - Não as honre! Ninguém nunca fez uma estátua de você ou de mim, então por que deveríamos dar atenção a elas?",
  "Preceito Cinquenta: 'Não Se Demore em Mistérios' - Algumas coisas neste mundo nos aparecem como quebra-cabeças. Ou enigmas. Se o significado por trás de algo não é imediatamente evidente, não perca tempo pensando nisso. Apenas siga em frente.",
  "Preceito Cinquenta e Um: 'Nada é Inofensivo' - Dada a chance, tudo neste mundo irá machucá-lo. Amigos, inimigos, monstros, caminhos irregulares. Seja suspeito de todos eles.",
  "Preceito Cinquenta e Dois: 'Cuidado com o Ciúme dos Pais' - Pais acreditam que, por nos criarem, devemos servi-los e nunca exceder suas capacidades. Se você deseja forjar seu próprio caminho, deve vencer seu pai. Ou simplesmente abandoná-lo.",
  "Preceito Cinquenta e Três: 'Não Roube os Desejos dos Outros' - Cada criatura mantém seus desejos trancados dentro de si. Se você vislumbrar os desejos de outro, resista ao impulso de reivindicá-los como seus. Isso não o levará à felicidade.",
  "Preceito Cinquenta e Quatro: 'Se Você Trancar Algo, Guarde a Chave' - Nada deve ser trancado para sempre, então guarde suas chaves. Você eventualmente retornará e destrancará tudo o que escondeu.",
  "Preceito Cinquenta e Cinco: 'Não Se Curve a Ninguém' - Há aqueles neste mundo que imporiam sua vontade sobre outros. Eles reivindicam propriedade sobre sua comida, sua terra, seu corpo e até mesmo seus pensamentos! Eles não fizeram nada para merecer essas coisas. Nunca se curve a eles e certifique-se de desobedecer seus comandos.",
  "Preceito Cinquenta e Seis: 'Não Sonhe' - Sonhos são coisas perigosas. Ideias estranhas, que não são suas, podem se infiltrar em sua mente. Mas se você resistir a essas ideias, a doença atacará seu corpo! Melhor não sonhar, como eu.",
  "Preceito Cinquenta e Sete: 'Obedeça a Todos os Preceitos' - Mais importante, você deve memorizar todos estes preceitos e obedecê-los sem falhar. Incluindo este!"
}

-- Lista de preceitos em inglês
M.precepts_en = {
  "Precept One: 'Always Win Your Battles' - Losing a battle earns you nothing and teaches you nothing. Win your battles, or don't engage in them at all!",
  "Precept Two: 'Never Let Them Laugh at You' - Fools laugh at everything, even at their superiors. But beware, laughter isn't harmless! Laughter spreads like a disease, and soon everyone is laughing at you. You need to strike at the source of this perverse merriment quickly to stop it from spreading.",
  "Precept Three: 'Always Be Rested' - Fighting and adventuring take their toll on your body. When you rest, your body strengthens and repairs itself. The longer you rest, the stronger you become.",
  "Precept Four: 'Forget Your Past' - The past is painful, and thinking about your past can only bring you misery. Think about something else instead, such as the future, or some food.",
  "Precept Five: 'Strength Beats Strength' - Is your opponent strong? No matter! Simply overcome their strength with even more strength, and they'll soon be defeated.",
  "Precept Six: 'Choose Your Own Fate' - Our elders teach that our fate is chosen for us before we are even born. I disagree.",
  "Precept Seven: 'Mourn Not the Dead' - When we die, do things get better for us or worse? There's no way to tell, so we shouldn't bother mourning. Or celebrating for that matter.",
  "Precept Eight: 'Travel Alone' - You can't trust anyone, and no one will always be loyal. Therefore, nobody should be your constant companion.",
  "Precept Nine: 'Keep Your Home Tidy' - Your home is where you keep your most prized possession - yourself. Therefore, you should make an effort to keep it nice and clean.",
  "Precept Ten: 'Keep Your Weapon Sharp' - I make sure that my weapon, 'Life Ender', is kept well-sharpened at all times. This makes it much easier to cut things.",
  "Precept Eleven: 'Mothers Will Always Betray You' - This precept explains itself.",
  "Precept Twelve: 'Keep Your Cloak Dry' - If your cloak gets wet, dry it as soon as you can. Wearing wet cloaks is unpleasant, and can lead to illness.",
  "Precept Thirteen: 'Never Be Afraid' - Fear can only hold you back. Facing your fears can be a tremendous effort. Therefore, you should just not be afraid in the first place.",
  "Precept Fourteen: 'Respect Your Superiors' - If someone is your superior in strength or intellect or both, you need to show them your respect. Don't ignore them or laugh at them.",
  "Precept Fifteen: 'One Foe, One Blow' - You should only use a single blow to defeat an enemy. Any more is a waste. Also, by counting your blows as you fight, you'll know how many foes you've defeated.",
  "Precept Sixteen: 'Don't Hesitate' - Once you've made a decision, carry it out and don't look back. You'll achieve much more this way.",
  "Precept Seventeen: 'Believe In Your Strength' - Others may doubt you, but there's someone you can always trust. Yourself. Make sure to believe in your own strength, and you will never falter.",
  "Precept Eighteen: 'Seek Truth in the Darkness' - This precept also explains itself.",
  "Precept Nineteen: 'If You Try, Succeed' - If you're going to attempt something, make sure you achieve it. If you do not succeed, then you have actually failed! Avoid this at all costs.",
  "Precept Twenty: 'Speak Only the Truth' - When speaking to someone, it is courteous and also efficient to speak truthfully. Beware though that speaking truthfully may make you enemies. This is something you'll have to bear.",
  "Precept Twenty-One: 'Be Aware of Your Surroundings' - Don't just walk along staring at the ground! You need to look up every so often, to make sure nothing takes you by surprise.",
  "Precept Twenty-Two: 'Abandon the Nest' - As soon as I could, I left my birthplace and made my way into the world. Do not linger in the nest. There is nothing for you there.",
  "Precept Twenty-Three: 'Identify the Foe's Weak Point' - Every foe you encounter has a weak point, such as a crack in their shell or being asleep. You must constantly be alert and scrutinising your enemy to detect their weakness!",
  "Precept Twenty-Four: 'Strike the Foe's Weak Point' - Once you have identified your foe's weak point as per the previous precept, strike it. This will instantly destroy them.",
  "Precept Twenty-Five: 'Protect Your Own Weak Point' - Be aware that your foe will try to identify your weak point, so you must protect it. The best protection? Never having a weak point in the first place.",
  "Precept Twenty-Six: 'Don't Trust Your Reflection' - When looking at certain shiny surfaces, you may see a copy of your own face. The face will mimic your movements and seems similar to your own, but I don't think it can be trusted.",
  "Precept Twenty-Seven: 'Eat As Much As You Can' - When having a meal, eat as much as you possibly can. This gives you extra energy, and means you can eat less frequently.",
  "Precept Twenty-Eight: 'Don't Peer Into the Darkness' - If you peer into the darkness and can't see anything for too long, your mind will start to linger on old memories. Memories are to be avoided, as per Precept Four.",
  "Precept Twenty-Nine: 'Develop Your Sense of Direction' - It's easy to get lost when travelling through winding, twisting caverns. Having a good sense of direction is like having a magical map inside of your head. Very useful.",
  "Precept Thirty: 'Never Accept a Promise' - Spurn the promises of others, as they are always broken. Promises of love or betrothal are to be avoided especially.",
  "Precept Thirty-One: 'Disease Lives Inside of Dirt' - You'll get sick if you spend too much time in filthy places. If you are staying in someone else's home, demand the highest level of cleanliness from your host.",
  "Precept Thirty-Two: 'Names Have Power' - Names have power, and so to name something is to grant it power. I myself named my nail 'Life Ender'. Do not steal the name I came up with! Invent your own!",
  "Precept Thirty-Three: 'Show No Respect' - Being gallant to your enemies is no virtue! If someone opposes you, they don't deserve respect or kindness or mercy.",
  "Precept Thirty-Four: 'Don't Eat Immediately Before Sleeping' - This can cause restlessness and indigestion. It's just common sense.",
  "Precept Thirty-Five: 'Up is Up, Down is Down' - If you fall over in the darkness, it can be easy to lose your bearing and forget which way is up. Keep this precept in mind!",
  "Precept Thirty-Six: 'Eggshells are brittle' - Once again, this precept explains itself.",
  "Precept Thirty-Seven: 'Borrow, But Do Not Lend' - If you lend and are repaid, you gain nothing. If you borrow but do not repay, you gain everything.",
  "Precept Thirty-Eight: 'Beware the Mysterious Force' - A mysterious force bears down on us from above, pushing us downwards. If you spend too much time in the air, the force will crush you against the ground and destroy you. Beware!",
  "Precept Thirty-Nine: 'Eat Quickly and Drink Slowly' - Your body is a delicate thing and you must fuel it with great deliberation. Food must go in as fast as possible, but fluids at a slower rate.",
  "Precept Forty: 'Obey No Law But Your Own' - Laws written by others may inconvenience you or be a burden. Let your own desires be the only law.",
  "Precept Forty-One: 'Learn to Detect Lies' - When others speak, they usually lie. Scrutinise and question them relentlessly until they reveal their deceit.",
  "Precept Forty-Two: 'Spend Geo When You Have It' - Some will cling to their Geo, even taking it into the dirt with them when they die. It is better to spend it when you can, so you can enjoy various things in life.",
  "Precept Forty-Three: 'Never Forgive' - If someone asks forgiveness of you, for instance a brother of yours, always deny it. That brother, or whoever it is, doesn't deserve such a thing.",
  "Precept Forty-Four: 'You Can Not Breathe Water' - Water is refreshing, but if you try to breathe it you are in for a nasty shock.",
  "Precept Forty-Five: 'One Thing Is Not Another' - This one should be obvious, but I've had others try to argue that one thing, which is clearly what it is and not another thing, is actually some other thing, which it isn't. Stay on your guard!",
  "Precept Forty-Six: 'The World is Smaller Than You Think' - When young, you tend to think that the world is vast, huge, gigantic. It's natural. Unfortunately, it's actually quite a lot smaller than that. I can say this, now having travelled everywhere in the land.",
  "Precept Forty-Seven: 'Make Your Own Weapon' - Only you know exactly what is needed in your weapon. I myself fashioned 'Life Ender' from shellwood at a young age. It has never failed me. Nor I it.",
  "Precept Forty-Eight: 'Be Careful With Fire' - Fire is a type of hot spirit that dances about recklessly. It can warm you and provide light, but it will also singe your shell if it gets too close.",
  "Precept Forty-Nine: 'Statues are Meaningless' - Do not honour them! No one has ever made a statue of you or I, so why should we pay them any attention?",
  "Precept Fifty: 'Don't Linger on Mysteries' - Some things in this world appear to us as puzzles. Or enigmas. If the meaning behind something is not immediately evident though, don't waste any time thinking about it. Just move on.",
  "Precept Fifty-One: 'Nothing is Harmless' - Given the chance, everything in this world will hurt you. Friends, foes, monsters, uneven paths. Be suspicious of them all.",
  "Precept Fifty-Two: 'Beware the Jealousy of Fathers' - Fathers believe that because they created us we must serve them and never exceed their capabilities. If you wish to forge your own path, you must vanquish your father. Or simply abandon him.",
  "Precept Fifty-Three: 'Do Not Steal the Desires of Others' - Every creature keeps their desires locked up inside of themselves. If you catch a glimpse of another's desires, resist the urge to claim them as your own. It will not lead you to happiness.",
  "Precept Fifty-Four: 'If You Lock Something Away, Keep the Key' - Nothing should be locked away for ever, so hold onto your keys. You will eventually return and unlock everything you hid away.",
  "Precept Fifty-Five: 'Bow to No-one' - There are those in this world who would impose their will on others. They claim ownership over your food, your land, your body, and even your thoughts! They have done nothing to earn these things. Never bow to them.",
  "Precept Fifty-Six: 'Do Not Dream' - Dreams are dangerous things. Strange ideas, not your own, can worm their way into your mind. But if you resist those ideas, sickness will wrack your body! Best not to dream at all, like me.",
  "Precept Fifty-Seven: 'Obey All Precepts' - Most importantly, you must commit all of these precepts to memory and obey them all unfailingly. Including this one!"
}

-- Função para quebrar texto em linhas com tamanho máximo
function M.wrap_text(text, max_width)
  local lines = {}
  local line = ""
  local words = {}
  
  -- Divide o texto em palavras
  for word in text:gmatch("%S+") do
    table.insert(words, word)
  end
  
  for i, word in ipairs(words) do
    if #line + #word + 1 <= max_width or #line == 0 then
      if #line == 0 then
        line = word
      else
        line = line .. " " .. word
      end
    else
      table.insert(lines, line)
      line = word
    end
  end
  
  if #line > 0 then
    table.insert(lines, line)
  end
  
  return lines
end

-- Retorna um preceito aleatório formatado em linhas
-- Retorna um preceito aleatório dos 57 preceitos de Zote
-- @param lang string: 'pt' para português (padrão) ou 'en' para inglês
function M.get_random_precept(lang)
  lang = lang or 'pt' -- Se não especificado, usa português
  local precepts = lang == 'en' and M.precepts_en or M.precepts_pt

  math.randomseed(os.time())
  local precept = precepts[math.random(1, #precepts)]
  return M.wrap_text(precept, 60) -- Quebra o texto em linhas de até 60 caracteres
end

return M 