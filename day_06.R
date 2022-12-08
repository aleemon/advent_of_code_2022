##-----  Overview  -----

# Find the first unique 4 letter sequence
# Sequentially from the start of the string
# Answer is the first digit to make the string unique



##-----  Input Data  -----

input_data <- str_c("djhjvjggdzznllvvrvggscgscsrrffgvfvllfclcrchhwzhzqqlhqhffsdsmmcffnggcttdpttwpwttjvt",
                    "jvtvqqctcwcmcsswvwzzlnzlnnvbnbdnngmmhchrcrqqhbhllbtllmppgjjtvjvdjvvpcpjcjjfrfzfzzdv",
                    "zdvvswvvjzzbpzbzzddbndbbgjbjjvpjpjtjqtjqjcjmcjjrtjrjrqqvtvpvwpprhphrhdrddpdhhfsspddq",
                    "nqwnntrtnrrthrhtrtwtdttmmnvmnmppswsqwqjqwqbqrqbqdbqdqgdqgqtgqqgzzhpzzwswvwmvwwvvrzznw",
                    "zzbsbhbfhhvcvwvvrzrgzzfhzhhlthlhqhgqgttlmljmlmqqjddtqtctbblplddnqnzqnnzrzjrrqwrqqcfffb",
                    "dfffspsqswstspsvppqmppdmppdvvfrfddqhqzqddtjddfqfrfllnjjcnnjzjmzmtmddbvdvzvbzzcjzzffdbdb",
                    "sswshhrwrrfggpccszzzgdgvvlflwwdbbhqhffngffdfdmdgdhdmhdmdsspssctstdtdmdhhzvvcbbrqqmrmwwjm",
                    "jqjmqjmjjjrmrmlmmbppmgpgttmptpspmmrttcddtjjspsfsqqbhbbzzgbzzznwzzlddmtdmdgmmlnljlvjjtgjjg",
                    "gmmnnvqnqzzfhzhttvbbprpmpmrmlrmllwmlwmlwwsjjlffbgfggqmggqgvglvvrpvrpvpnpphmhnmhhbbqjbbrrvfr",
                    "fwflldffzwzccscqsqppctctddqbbmggmccdbdvbdvvpdpdbdsdjsjbbwpwcpcbcbmmzdmmvtvqvpvphhlblwwfmwmvv",
                    "dhdtdwwlblglhhvfvwwqggrnrttpddtvvwqvqmqhhwnnghhbpbvbnvvdqqrqdqwqppmwpwhppnmnjmnjmjttvhhcgchcs",
                    "srlrwllpdpndpdtptzppqqpvvtffcwffjppvnnjvvjnnwcwnnhlhjhsjsnjjzfjfsfhsssvttvfvsvpspppwswmswwqmwwz",
                    "vwzzvtzvvwddqqzhhqpqjjwrwlrrbcbvvqllqjllvzvgvmvhmmsppwvpwphhjnndjjtpjtthzzvrrcwcrczzmqmsssvtstq",
                    "trrgtrtvtwtccbwcwrwbbdbgbmmcsmcssvjsjqqsnqqtvvbgbfbdffhjffvnnzpplqppzzfwfrfnfcncqccgjjcffhshrhgr",
                    "hghvhphccqtcqtccjzccdnncggftgttrppnpptlltztqtjqqvfvqvdvmvmjjgqqrqgrqqcggdvvpcvcjvjnnrjjmbmlbmmqvmq",
                    "mfmwmpwwnhwdtmvhqfwlbpzjplfhfntjgmvqmmjqpbngpvjvpgzpqwjjwhvjwwplrtjhzmzqmdrppgbrspmctlggmflbjzzfcvv",
                    "dqlrtvqvwhcpjnmlvfgwrwwtblpqstddnqntnmwsbgjfrbdrlnvqdrnttshjmvpmncmggfdbnndwzmswmdvhmmwtgpfglrzzhwcs",
                    "gvhnnrrhmnhftvvqfdfrsphzbslgscmwsnrwbvqphhswvpvsbbstvnndclhfhdctlvwrmdgzfcfmjmznqvvqrddmdlqznvcsqsgnp",
                    "cqqhbdwqntcnqljstqvrzhgvzqdltpwmnpvjmqrpjsfhqvhchjnwjnqpdqbdjqdpqsqhbwwmhfthzbrsjnhncpbjrhgqlzmrzlnvrr",
                    "fvlrmflcqfmqjzjwscrflgzwtbchfrnvsrrtncvhjbnnmlmmfdjcbmbsmgdtwzwcwnthfbsnrgdfwqjncqsdmfnfqgtcwrhjprlnhvrn",
                    "pmnnhlwstvqjrsprqhjzszzgfznmgwjqglvfrrwpdbptdrnbbwbzbcbhbtcchmfsgmvnmrbdqhqgmvtfmvpgvjzjpgjbdhcfrfhprgdz",
                    "rprccnhbmzdfjsgldlgpgdrfhbhtmhdttdsbndgbdfccqhhwhqfmlsfhsbbbmdncrwzcnrdvcmhllfwtrgjpgngzwptnqtggtcjwrptf",
                    "fmsrgdpctsdjtpssngsdqwfsbhdbcqvbdrzlhzlsbbzhqthzhcwsftlhrmhgpfzljgcphjjvhpqjzsfnrztwrhlnlbmgcgmstrbbwclp",
                    "vdtdpclzlhmmpmmpmppnwjglhwppprlbzbvwqwmpgtvvpgdthnwbtblwpwgvmbcbjwjbczlcmzfwzbqvzsvgcmspvrsblldscqlgghdwz",
                    "bvhhvgcfwgnqwlngclbjfwrpwtdjvqmzwwjztwdjplhzpzfslbbvfdsnpggwcttzwdlzgqgmrnpnclhrlngtwcwblzdjmpgqvzsvsdmzd",
                    "wlgcdlccnnlrcvtrvspcsmgmzzvwnlzwtznwtqtdjcnhwrqhqrmvqqhrpdtnsmfrlcgpjcnddsqzcppgrnhvwsdbjvvtmvbjdncpdnmzf",
                    "swmtvzfbdpqfjvwvqlhptnpdfdnlwfrgstpvvmhsqfgggdrsfgldfzbcjzhqzvfwmzccwjrslhjwlbmrpqgzdfnfbhsmdpzwtqnqldtqv",
                    "shvlvmlnnmqrqbpwvnhqhtcbfclhrcqlqzhsqplsnbczvrbzqwlfwjdtmstzdbswtrvlpzzlrfvgdmldbwcttztrvsgzjwhhpcrvtgzfz",
                    "ppdlrdwswbnjfqqpqfbcqlzdmjsgjtzmvhdzspwlqpdjnccmbtdhnnhfvwqclbzzgglfgmvvgrccdsbwfmpvqwqrhmdzfhhhgbgjgwmnz",
                    "mnggfrpspchvzpcmcpsbzgldmgqjqqdcjpwwncwrwjbhgzdbbcmbzbbtvprsjrhfwgsppdrrlzvnmtmwrmmrhtlndvsvjvgqmmttbbnpd",
                    "hnjhwgrvlrdtpbrtwpwvvpslcqnvnrlhpvgdwnrzjmhwmgvpndtrjlzqpfzfbrsgbzjjqcfgsfwchblzstdflblngtzbrzrrvsczqvfhj",
                    "jdlffrghgqvqfdtstqlnzllsrnnrtvrzdphbhdfpmhlfncqbdtzjqqcfbzpvgzdcsvvbfdvqrfrncbrwmpdmhnlqdscwnvldzblpzfqcv",
                    "nbzmmtbmwjbczsjvzmfthfpvjcpwftqcbgjwflfrbrggwnvwndtncljfrdfwqwhfbctpjghfvnjnntnrgbfbmhplgmpfvmgvfqjslgnnr",
                    "nlgztlstpcjwtlhmwlljcfmptfwsphnlsrjwmgtghgqmsvwvqsmblwpdftbrwjcdlzjmjblghszznqhsnqrcmtccgdwrrlsmwswvrjltq",
                    "mwsdwvpnzltllhrsdvmrntdhtwwbgrqmrffnqbqrczvzchbgmzwtjtfzwntsnlbwbgrlvqjsqmdnwjqlwrdpnfpggzrjvtrhqdbmmbtfm",
                    "mblgwtrqccqbjnljqflhgtphvrgrgghgrpbgfgdztsmfwrfflsqmrwbfjwsmpfrnbqjwnwdqwcwzpwbsmngjwfmbwdmnprdjnjbmqgfcb",
                    "vtcvcthpmnmvvzdzgqqbhtjqfcdvhfzwqgfsbtvnwbzpmmtswfntjjppsswgbfrjbrstltdgbmclmbfvlslghbhnqqbdlzgtctgsfnwvb",
                    "pzbvnwfbjmbfqcpqqvgrzwcbrwzdbdsjsslcjlmtprntpsdmqldzwqlqztwqtqfqzmrnzbtpqlfnsdwfdgggfvmqmrdqmnffnzcwfzsrq",
                    "fpvrmsfsrbnpbhnqvdglvglllpggpmwmngrhzwgpdlzrbsvjtqmshhnlzwwftdtqwrqwgbbnczqcwmsvcljqlscftwflhwwhgnqwztfch",
                    "dzsllrzbhbqwcfztjnqtdmsfnlzlcwzfmtlcgwclzfhhldgrnfjvzthzqzmzvwcrnhpdcwswpddsbwtznwlcwsnfqnqwnntngplwnfgwr",
                    "cnpvgffwrcrszzdbfvzjmrmlrjwcvdvbglgncjwcnnpdfnwsrzsvzgnjrlqmwhvtdgmpbqmjthmhhmzjhpvnbvrqnlspdbcgshwlnvwpv",
                    "rbcmvbvcsdmgwtmsthqtcfmllsfwvqcrbmdgqtzjwrg")

## Sample data

input_data <- "bvwbjplbgvbhsrlpgdmjqwftvncz"

## Answer = 5

##-----  Problem 1 Solution  -----

#uniqchars <- function(x) unique(strsplit(x, "")[[1]]) 


find <- function(input_data) {
  
  for (i in 1:nchar(input_data)) {
    
    subbie <- str_sub(input_data, i, i + 3) # Subset the data
    
    if(unique(strsplit(subbie, "")[[1]]) %>% paste(collapse = "") %>% nchar() == 4) {
      
      return(i+3)
      
    } 
    
  }
  
}


find(input_data)

## Gold star!


##-----  Problem 2 Solution  -----

## Need to find first 14 length message

find <- function(input_data) {
  
  for (i in 1:nchar(input_data)) {
    
    subbie <- str_sub(input_data, i, i + 13) # Subset the data
    
    if(unique(strsplit(subbie, "")[[1]]) %>% paste(collapse = "") %>% nchar() == 14) {
      
      return(i+13)
      
    } 
    
  }
  
}

find(input_data)

## Two gold stars!
