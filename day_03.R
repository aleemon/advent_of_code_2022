##-----  Packages  -----

library(tidyverse)



##-----  Problem 1 Sample Code  ----

# Strings of lower + uppercase letters
# 1. Halve the strings
# 2. Find the matching letter (case sensitive) in both halves
# 3. Sum the results based on priorities
# a-z = 1-26
#A-Z = 27-52


sample <- c(
  "vJrwpWtwJgWrhcsFMMfFFhFp",
  "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL",
  "PmmdzqPrVvPwwTWBwg",
  "wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn",
  "ttgJtRGJQctTZtZT",
  "CrZsJsPPZsGzwwsLwLmpwMDw"
)


## Split in half
compartment_one <- str_sub(sample, 1, nchar(sample) / 2)
compartment_two <- str_sub(sample, nchar(sample) / 2 + 1, nchar(sample))


## Find matching character in the two vectors
matches <- map2_chr(
  str_extract_all(compartment_one, pattern = "[a-zA-Z]"), 
  str_extract_all(compartment_two, pattern = "[a-zA-Z]"),
  intersect
  )


## Compute the value of the matching characters
values <- data.frame(letter = c(letters, LETTERS), value = c(1:52))

answer <- sum(match(matches, values$letter))


##------  Input Data  -----

#! Not sure why I can't just read it in natively?
#read_lines("https://adventofcode.com/2022/day/3/input")

input_data <- data.table::fread(
"GGVGlqWFgVfFqqVZGFlblJPMsDbbMrDMpDsJRn
LwzHtwdLHHwDrzPZzzsJbJ
wdLTBvSvHvZVGCjhfN
HsSSnZVHjjssZnJpSJjBHHWgQGcgqqQLQdQFqNgWgqGNDg
rmmRwrtfThtTrbCrGGGcLBDTqDBNQLdL
mwPrrbzPfwvbzhwMMnnjHnBjZlnzMM
gjjdMBgdqdTpJpBcjgRRRlqnvrqfnZtrtZDw
zHShWLhCszCWHVbVzQWCPtQvNZRwtfftfNnrnftlfR
PzPSssHbVhCLFMJFcMFJJMjdJw
ZqJdtpfpjmpJjpnwWdttTCDLLTQFNTzTzrcqrQqc
MsSlBGvBsSGGSlbGsCgggNTgzNLczFQNrNQVQcFzFF
sGHHSGllhvMGhSRGCjtjtjnjnnmHWpWWtJ
tMdjQlHPHsGjsCtsCpwwqfhfnnFMDMrpfD
SbNvWvBRJRWwFSgppgSrfg
RNcNbvzJRcVLRVzTRFLjdHCQttdZdPlHstPl
QWqgpdBflpHNCNWNHHPm
VVMbbJsLFVMhrMJMmRjFNHwHjjCTGSSRFj
mbMsZzsLmVhJZrcLcJhLMtnqvBnZdggplDffvlnlvnDn
prnNnsFnZpnBNdNtFrNnzNQQwTTQZqTHTQJQMwHDMDlZ
jgfgcSmbLmhmcPShghRdmwJTQjTlqGlJQJHqQqGHqQ
hRVhPfbCgbVggLVRSSmRhRPhrrrnCzzsvCvrnvFnNppsvBtd
QJLNDWSWQdLFFFhLdt
npHhHMsfsjpZjznRtmrMCdBwFBFrBdmt
HsjHqRRfnnHRsgfHffZspgzqDGQSWbQTDNGhQhSqNPhDWWbT
bsCmFDsGZCNsDmLDLZBSHSJTHnrZQMQSSQ
jqRpwvfqnnRQrftdBMHddB
phpchwpzjpvwRzwcsnlFsssPCCGzDlsD
rMqzVQfrfVZWZhTdRTQL
cgmtFtjFFJDDtFvSFRZdLlhpHZddmwTZWh
FbcSTtctcvFTJNgtJDGNPnCqMPMfMBfznGVsrMCq
wLJfGJJPZLBfwSLGHbqmhhDHHhFDzfhv
FsnpFjVjplTQCspNlCDbzhMMbqvMvsgmHDqb
lRdlTdTddllpRQFRltVVdFRcwrtrcWWcPrrWPrPSrZWLPc
VGVZhTppGTfPnJVJrFqbsmbSSshHqWqRHF
llzDCzlBLdNcCddlMMNBdCCtWHbFqFRRRsHjWtRwSWqbmjWm
NbcMBBvzzMQLCDBVTQQPVrPQPPZVPp
cdcgfmQdqlqhzzPjzfwpwf
GLBGBDvbvRzGwtnnmPpp
ZRCZBRFSRvLRLFvvbLLFQdHMTHTlQlNqNmqFlWdH
vzjzvHtcHvJcDStLLGSShCbbfF
MWFFTVZRMmMgdQdSQLwQrQwbGw
gFTmgmVZssRsWZRNzJlBHHnnJDvzNPlP
rHrvHpmHZfdGDDGGZd
cTlMsNhllMhGchNPCBlhMQgVDdgDSSWVbWVwRQwRSgbV
lnBjnNNTTMnCTcChPNhMvtzvFGLtJrjFtHHHzHJm
lgpdZZMmGVVzVZzt
HfHLrHqbPbzJJzRJJPTl
HsLWWbDqFrqlqfbsbDqDBncpgFmmvpnmmgpvdvjcdM
GpNVbTpJJNvMBMVvJTGvhnWQQScllnhhWlhVSznV
ZjswwHHLZzGnjWjSjl
sHdftLLtgLfwdtPmHtMbNpMTpNqGRbPvTqPv
sHSNNhNwsllGSGGlWSGWSsFrrVbQrdmFrVrrmnrHmrHr
QQMRZDDRcrcnmRcV
fJfCPMJCzTMZSGsWwsWBwqQf
HwQZZJsHdqqsdJQGRgCgVGgSqgpcGG
ljWWbnPhjBlGpCRCnScSGg
hrrztWlbPjltjMPSdJDZSsHttwsZwD
VzzbmzvpvNhvBDqc
QHSJSQGCwJCGrGQjjcgcBFhdgqdqFdDNNw
rCGJtZrHhhtLRsth
TMWwCLPpMTThrvtMRJjbjRvmJs
fDzcHFfSfFQfZzZRJbdmmqqssqtbSW
WWgGZglcllgPBBCBNVGPNr
wrwwhpTpbqhqrshrrfrFfwfzRJGdNJHNmcFzCCzCRJGzGR
vMggvjQvgPvQjVLMMPSZqWNJGCzcNGdcdzHPPzcmCzPz
qDZWvBZVfDhbTtrp
LpDvHdjVghnjbGrn
FBBBPwwlBlwSfFTWPHPWWhmgngmmnPnmbsngngbGrb
FwftBSCSfWCtwfVQDvHHCMVvdQLQ
ZrQpQlSpNlqQCVnQBmdDqmWDqmWWBDBB
HsZMsJvZzLMHTRwWhgDwmfDBgdhWdf
RZvTzJGzRjFrVNVjlQrS
mqjMwfqlSSPmSrlPhwhVpGRcppWcpcGRcGWv
ssJDJJNgZNDWrRWcRpvr
ZTsTnnsLJQgPnfMwmnMrfm
qsVBvZqWLdfbfvLj
mPNRgmHBBGQrCbSbrdfCCSbC
PlQTGcTTcgGFQQGPTGllpqMzwzpVJZwBMssZ
FWGcNRLRLhwJJQfV
nzbzlDBHSpTDbpDpzHwCqhqwJJghQqQMCCBw
JnzndzpmJFmNsrrFsc
gmRwwDwfnRDJgwZLFQFFNGNQrFBmFbbm
CCVHVWWThSrjVGvbNj
WpdqpplppHCWzlClMMTTZJcJsdscJLLdbDDfZDgL
VNtCCMDllpBqDvtdCczTSgjHlzGSHSGZTZ
hPFPsQhhFhLnbsRnLFssdzcHdsSHSSHgjzHG
QPWPQrPPmbdnbWLFPrrBVrVDBqqNMVwttDtBvD
PPNNRggwgRRgHBhDtwhTwbDs
SFGSFSMCJFMrcrCMSSsbtrTbbZhBvtHhrTHD
MFfSMpflQLQflfLjnLmddsLdddqq
RcgbcrrFscVrwZVCgVGGmHppNNndWnGdNqddqqNqND
jTlSTBSTjLTvlvjjPtvMLlhHnftphtDFNFqDnDHWNddn
QBMQvzzjzvJPjFQMmwZJrgmCCJVRVbbc
CzPJsWCpvsNszsJsNsHlDhMrrJGjhrRVhRGgDDjG
tFFdbqFLFdwctQdfVhjRRghTcrjVRTDW
bwQtFLdLBdFmwnHnWHPBNnHCnp
CNTstGNslRRRstlmNmmTZZqfFwtqgwqgfBPSwSWwqgWq
hpDbcHbpSrcgqqzhhWVfqg
DDcLDjbMjCSsZRNlMv
MhHMCMNbzbMHlcqmGmrmWc
tnPggdZPBPgdtttJpdnwVBnmqQcvlQrQlfGqmfWffBcqWD
VPPwPPLPwLGFGLzCbG
rqBcBmjHTGfPbcVgPG
dlDpsdshzlldlDvsWlWvLQbQBbfLFLbPvbBGQBgG
BlBznnRWzlphphBnhZjZtNNCNmrNqjCqHwHN
mQBvmvBmmLJvvrLtttQrfhGlcRGfRhVGWJVChlRG
MzPswTsbTPPsNgMNszgzMpbMfcRcGflVGRfWSpFRlWWWFhcC
bcPsTbgbbTTwNZzTZzvdjdjtQQndZvdrvdmZ
hQzTQJFFZJrcdcdZFFrGFSVWVRWRwRgRHVMWDCDSWc
lPmpNBnnnsNBnLnfbfnCDWMvwRvDCCMPwwHWvM
HpjmffNlnqqhddTddFZjGJ
BwsLFFbHLbVCSCSFbsbFLsJbqnTtZrRMHTZtrTrZTcRRRRTq
lGhNhpPmmhpztZTBrcpjRqpB
QPzdfzBQNgFJSCwsdLbS
ZsZsSBTgffSCqSSfrMnnMwjqmqmnnnqwMm
bbPPbzVclcPzGNlvzVtmnDBnQmtnQLBjJVLn
zPFGplGGvdPbHplcbzzvdlNBTThgRpCTCTfhfsCCsSRZhR
CVLSVCLVZRsHcnzSRpdZZRCdPlmcMWDDlPNqMqtDMmqPMlDt
TBnGjfQrQJjhfWlPPmPQDNlmlP
fjhhGvjvvrTTBhvTBTbvGVRLzVnbSRZpHddspHRzLs
DDtWjfRfftWMLzSQjzzhWjjwRVPHqFbBbZHVwZBFvFwZvZ
JGllgCJlJsrCGPrCNTPdslvZVVNVbvBqNbbpbbFHpBwZ
CcPdnCdmCJjfcftWhtSL
pgpfddDGHWzDNGNGpRCQjCTFHZZQFQjcRT
bJlhqmMvnlrRQFtTthPVhZ
lvbJrlJMBwfzGNTddB
wpbJGGZpsjvtdWvGWF
HqqhBhBqhhNQHTSHqqNzRHVPvTvddWrjtrjFvrvdTdVP
NRLCRzlqHQtNRBLzQllhhZcgbggwmLDZpsgssDpwwD
pDzFzJFcVMcWJFJFzpLBsqWLZssshsGLGbsS
wqHqfvnfrRwQtdQRthhBbBbZLhPLnBTGsh
CfQqlqvtfHNvMVmzmmMCFDMc
GcgpNHvcSNvpSLphdhsLdQTsdWThhQ
wwzttPrrhQswdhnT
tjJjMJRbRbjztmjtjbgcRsNlgglHpDFSlSvg
VVLvLqqPVlvcqLLdwLbHpzcHSsbRJppHbHpF
CfjjCNGmMWhWjhWHWb
ZmGZffggrDqZvZtlbTqL
TTmmhvBvvHWzHpsPpstpLVdwwsLb
qflfFgNctNcCnCCNDnfFFNDwrslwZbPswwZbJLJZbrlPLL
FgQDDcncStCgtqccjSDTHWMThvhTQMBQhWvWRG
SqhVghPccSBhgSBqWBFNQNsHQHMjCCQQWCwQHN
fLZftnlttcbbtZbZlpZtttQjwsCQjRwwRDQspMRMNNQs
TfLtvbJtZmlbTTTtlJbFvVqPSgBdPqPhFSGBcd
pPPNDptcqtpcDztLDhhngnnJgJTmJwNnwm
HVVCsSClHGBCHslWHbSCGGVngTrJwnnJnQRRBrhQhgJhdm
WTWWWsvVlvGbWCFvjDftPpjqZLLtDz
wWclwtDwRvflvffB
sMMsGdsSTMrJZNqczfdvhvnzCnfv
rspppMjMspSTSMpgLjcPFmwPLmPHwb
tCdSMHtHtRFHdWSSJQSgrrrnghTNJN
BGfcvDsfvsqcvqfGvfGnNLhggBNQJNJQmpgQJm
sGfQDPDZzfDZzclwDzwsDlfjtbdHClFRCMWjbMFMRFWbdj
pJNCcvqCccsVvFCpqsmvWJfCBWgSzBBRrrBRDDgDrSbbgQbQ
TMLnLjjffwfwGdjQjDDBjBrDtztRSb
MdPLGhHnMZhlPHHTFfZvVCpmmmcFcVFC
SwFMfCMRCdQDdMbmdFfdbbnlcVncVCcgLqWcNNnCcWlW
hPjQzzhGzhpPrtPJPpPHrVgnqVVncVVnNHlqVnncNB
ptjGrptztpthtrtJJhTsGwFDZZDQmSdfZSwsRZSwfZ
rSSWWCWrdllHWpjcnFNnRCNjQp
bGwwJqGVGbGJVVhgbBgttGmBQjFsMjpMcMnnMBcQFNnsssvv
bfthwmfJfgwwmmwZqVJPHNHSZHWzSlDPrdDdSH
nmJccvclcbwmlbbvVbvsHwJJPCPNCNPnLBhrBPPLBhLhBgBP
MdRGtdDRTqWDMqtMDtQDRWSdLLBsrhLgBCgrgCgNNLPBfNMf
dRZQdDdRRSQWGsjZmwzjmlzsZH
PBGGMrTQTrTBpPQpLpSlwjwfjtlnfwbmGttw
fCsJCWJcvRCtwwjbCl
NsqcsfcvDHFVDJvdLQTrpdTTzTPpHr
rltrwsBTlrfGZggGBLGGNN
jhMnRQJVphMnbhvQjDZNqqZDNTNHZVHGHq
MRvbhQRQQChpvbjvMSvQnMcsFsfwwmlCwFwWcTWwrmPc
DDvLLLBnvrzvbvbmtv
TMwRjTRMGCwGGwrjQQnmrQrrQdhZ
MJPFHFTwgCGqGqgJMGDfSWcsnBSccgVDlnpW
flzVzNrdLNLJzrGlfdlzjrQDgFTpDgDmmmgFmqFDQjQh
CbnBcsZnPZVSnwvVsZbRhhBDpgFphgmgDgTppq
ZWnsWSnncSZsntZCbsswwJMzdLzlMdNMLtMVfrllMt
ZffSgNfgJgGCHZcZrpHrNJTLhqvSLTqQnvVTLvzvLTjV
tWFtHMwlBlDqjjzjnqvvlV
DRMPDtWHPFDBFFwWMFBmFRPgZpJfsffNGJNrGcsprrsmfg
wRZRmpZmlPqZjzGrdrGq
bBhQQFPQbPDVNzVNzdGWNdrf
QFbcDcDbLHgHBPDFRsSSMtmvRttMpCLS
MpWJVVJMcWvpRShcwpLGflmqzSfNdfNLdQzN
CDBTtCgtbjgCRrBrPBTQqzflNqjGdLzzmqffzq
rFgnnBbttDTPtHCDPrPMnpwVJhJvMZvpMvppRZ
sWTTmpsfsWppPTTsTVZWHVVZNvVcdcJvdN
DjjBzjhRHvvvSzdc
rMBjjrjbjrGDlgMlMrGjBgRLPTTwHMsfnFwFQPMPMnmFFm
QRRbDjjmPzNQwFDNmrQmzCbVHrMhBVrJLJJfMGGLtfJBHh
dsWcsqqWSWvnWnWcWGPJLBqhLBqGhBJHHH
ZWnPWgWgPnlbCDDwmmDbRZ
nfPqqfLqQnfHBSqnzztQjVmjfGRWJNGRWsJWJfmJ
TTMlMMlFDMGVGRsVJH
CbDbFDbvgTFFwgTDlDprhlPSqBzSnPdLPtPPHgznQqBQ
fJmWVfHqjfjhZCQZ
NcNzBNvgszQmzjnthZQC
LsLsgBNFmFgTFgGBBgcdMdvPDPDJWrlpVbGpJWqHDlHJHD
SllDdvzgdFDdlPJvbFDDSzFScPTRTNcwfZRwRhcwwNnRZTtf
WBpWBCLGVpLjHrHGGVhZNwcTVcNhVnRcNZ
LHLQLspHWQGpWCHnBvdzDJFlqvdsqgSgqS
GcTctDMjMhpMDRjLsMMsfDWFfdPCFNbnCPnvCPgW
JmvwqlBwnmfdFPFP
SvZqHSZqqHZZZBlllBwSwsRsMHpLjpLsMGtsMspGRT
ClLnCLfClLVllfLLcQjLBCfCmSHVsttsmtsVStDNVdppdsSp
PFrRMbWqMRwFRqRSqwqvMvMsGtgsdmssrgNtdmpNdDGgdt
bwJbPWPwFFPFSczCZzZZCcfjBJ
MwmBmzwJQTcTmfPVfZPwhhwHPH
jlnrglFLvbrGRFGnvFZdNNFfPZddPThVhdPH
RjbjpgbnLGvpLgzBqBpmWmmzqTMS
FnsSpttPnPbNCFDtsPnFHQZTQZgcwgDDTfrfTHMZ
mRjzRzlvBvhjZrQmMMwfZZNN
ldzddlzLRlRWdhjdRLjhRWtJbJbNtJJpJPbCbGCWNG
wBwmNZBTmzzcVcmpzZqdMgPjnLSVlPgDPdbMdg
flJvGtHffHDddddbHjnb
RstrhfrhhRGFQtRhtftvQhvFZpsmpWwNlWqcWTccBNWswqNp
DPWhbzDlQLLlQbLDlLhPhLFNNJqCFGqnNJCCSCnGPnGN
wvwjtvtdwfssvSJgFFvGGSCFcp
mtdrZwwJsrtddrHRtZWbVThLlBzVTzhHQWhB
TsRRWctsTJMQZllggc
zDvhpbprgGvpvVlVQlZpQMJVlQ
rrrvFvGCDhDSrrrvChCgSstBNTSftWBjTdfWBN
JJdssBcLVGrgbBHWrH
QZTptvmvmlZpRDlMMMZCQvnjjFnrjWGFbjnrnFGWgZrz
TMRplDMggtwlppTlvhsJJqdcqwVPSSNcLd
JjTCCrcRvccPLmMP
NfGFPZlNnwBfPlbbbQZGqLHgzLghSmMBzSgvzmDMhv
ZfbnNQpQnZGlGlGpWTddjdTJdpRPTrCj
gWLblMMggdWsdRJlblMRMMqWDvPvcPPPccJPJVTZVZThmcDP
rQFfGfrCHrjnrtNTcPShTSPvvVLtmm
fQrCfLrpLHnCHwslqzqsslswzqRW
zpJtGlJPMPTlTjGJCDGCDljpdnvhhWnZnZnDwwmvnWDWWvdd
sHrVrSrRRRLNgLVBqSsZmWwvwcvwZjmwngmdbn
QsQQBrrLHTjPpTQzzP
JDlzHHzzptRDmbTMrrVQ
dRRNqnCBnmrQsVQQ
wFPCBNFgwjPwhgFNztftpJRPpzRvvHtZ
DlBhrDBPPwMWwhWchW
ntSqbbSJFJNqzVzjCfMvfSlSRWccRL
mVlHtNVtqldbJVmNHmdTTBBgrQQgGsPQdrDgsP
HWHNbBgvNLdcvQMnSf
wqqqVPDPhqwszFwrrszFfMdWthLcMdfhthSQfJSt
qVPVwTzFwFDpDrPDzDPFDPlCHjBGjTmZGjbWWGZBRTNjjH
GVgdWjllSqgjdgHqqlfmhwcpwCzhvZwMcScv
nsJQbLRQsNnzQDQQPPBbRBRhfZwpZcvwpvvmLCcvpcmfMM
DRJtnnRbBBnPztsrPzRBPbsFFHqqVrqggjFWqrgWjTGgFq
hhZJQPJFHGGlcWWslpNN
VwwwJjvwMtrCnwjDNDzlfscWszWW
nVStCrMqbVwqVqSqwnLPhTJFdRgJHZSFRLTP
vPgMbbRhhvMvNjjLWsWQsHQmHwBrmmBzww
tFctDnVFpppHVBTdzdTQwl
FtSFqSptfJCqqJStZCqDpDJMhvLLgLMgQgjgGZgGgMPLZg
zwsWgSGWLSVhPWhtLgLWhPVNQTmDrDQttZpdQtdpQDDQZQ
fjCHcvvjMDrppCQpVV
VMqRnVJMVLPzbRWhGh
mjRmzQlzDzNHWwDZ
FBfJBGqnnpfSVGnpJbJVfNtCsJHWZvrsNJCZrCNsvN
fZPBnfPqSBqdfpFbVnVSjgdcLLgRLjmgRhLLghlR
FSFnTcppdQtnnDhtzDfg
ZLGVmBLBVwZCVjjGqGhVwVVgzzbMDtNNvszMmMffNDDvtM
VZPJjBZVqBZZBjqwVqllpSTphhQFPShWSQcW
hTRdcLrCLgplLvBFGvlL
nZDZqzbDbDzRZtVNDzDWGwslsllBFpnlpGvJssFG
zbqjNWQVmVPrrRjRdRhS
VpNCbVHlHHZfflVfmchctqFcqQQjZmZM
WDSRGgsSvgJSRrnWgqQhmjBqmhqrtLqmQm
znSGTgDJnsDGzgwCwlpbCNwHzVtl
sTTTrpHFFFqTnQbbvfJdDzHHDLVV
CjMtgMgRvbPfjjvB
mhMvlhhWClvqshNTQQqsNN
tWFtFBzbwdFrpmdhdm
qTqDjJjJQQqMjTDLJjNqNqPNdmpcSmhdmhhmcrWZpdPGddcc
RjNQLJNTTJDDJRHHjQqnMWtlvvVvbtBvRVzgzgwgVg
CGdQjwdJrbBmpmZZZlRWcb
NgtMPVstgSzBLzhgzgLgDRlcmDWRmlZvcSmDSvvp
LhNsgPPLFPPsNzMhhVzPsGJBFqwQGfnqfQjdGdGfwr
CNbNdbzjCZpPNzjmzjsCMRJvnnMRGnsvJGRs
wrtdwTLWFcFWdFgwRRsnJGnGfTGJfMsq
FttcwgBtgVLgPldQSNZBzBpz
DjRZrrRmttRFDvDrFTZsnWnHVSTSSJVZJH
dNNhLqlLLqdCzfMMlCfSncTVVWcHdcVsVdSVnT
QqppMfzMfqWCwbRQrwFrrttQ
dwGjHrtjsdhfCHnPSpfMfDPpPDWS
lmNzzlLbFqcqNgzpWMSvbbvDQDGWDp
LBmglgmqBqmrwCGhCjVtBC
tvHgWZCCprlgpWglCtjPhLmPmhVdJFSzVzdJVmmQ
fBnTTnNNBnwfnNqcBbBBTbGJQQJhSSdQJJsmdJFSQGSmVV
cMcDwFbRfFRlHCRCZrrp
ZFWmgghzBgwgjWBzjzmRWWMmsVwnVrsdVdwNrrpnnVrPCnCP
GLLbtGqllctqvGJvSlQbJGsPnVdsdpsTPLsVppBCTVss
tJBStGSvctvDDfczmRgRZjzDjZmgzH
FMrLmsQQSWzCZBhpQJTQQZ
dPPVncVvPBJDCPhwJD
fvHbbVHvqnvvvBzgLbbGGmrbMr
mrZzrzqDrhZqDddSFrCGLLLPQPQBJPJJBnQq
TgbpGblWlMsjgWlgMfpNRgbRHHBnHHHtLpCJPCPBnBLJtQQL
sbTlblTlvRbbGblbFcdDzccVcDVvzzzd
zMzfzlGwSBMMSCMzhsPgfcPcfcbhjQPt
FHHqJVdJmFmdVrJdJppthscjGtqRPRcccgcQbR
rvNJJpLrvvLnJvNFFvZZZBWznBWGSDCMnCwz",
header = FALSE)



##-----  Problem 1 Solution  -----

## Split in half
compartment_one <- str_sub(input_data$V1, 1, nchar(input_data$V1) / 2)
compartment_two <- str_sub(input$V1, nchar(input_data$V1) / 2 + 1, nchar(input_data$V1))


## Find matching character in the two vectors
matches <- map2_chr(
  str_extract_all(compartment_one, pattern = "[a-zA-Z]"), 
  str_extract_all(compartment_two, pattern = "[a-zA-Z]"),
  intersect
)


## Compute the value of the matching characters
values <- data.frame(letter = c(letters, LETTERS), value = c(1:52))

answer <- sum(match(matches, values$letter)) 
#! This actually is lucky - match is just returning the row number
  # Got lucky that the row number matches the correct letter value!

#~ Gold star!


##-----  Problem 2 Sample Code  -----

# Group each set of 3 strings
# Find the matching letter between each of these strings
# Sum the matches as per values previously defined

## Split by groups of three
groups <- split(sample, ceiling(seq_along(sample) / 3))

## Find the intersection between the three vectors - basic form
# Reduce(
#   intersect,
#   list(
#     str_extract_all(groups[[1]][1], pattern = "[a-zA-Z]")[[1]],
#     str_extract_all(groups[[1]][2], pattern = "[a-zA-Z]")[[1]],
#     str_extract_all(groups[[1]][3], pattern = "[a-zA-Z]")[[1]]
#     )
# )

matches <- map_chr(
  seq(1:length(groups)),
  function(x) Reduce(intersect, list(
    str_extract_all(groups[[x]][1], pattern = "[a-zA-Z]")[[1]],
    str_extract_all(groups[[x]][2], pattern = "[a-zA-Z]")[[1]],
    str_extract_all(groups[[x]][3], pattern = "[a-zA-Z]")[[1]]
  )
  )
)



##-----  Problem 2 Solution  -----

## Split by groups of three
groups <- split(input_data$V1, ceiling(seq_along(input_data$V1) / 3))

## Find the matches
matches <- map_chr(
  seq(1:length(groups)),
  function(x) Reduce(intersect, list(
    str_extract_all(groups[[x]][1], pattern = "[a-zA-Z]")[[1]],
    str_extract_all(groups[[x]][2], pattern = "[a-zA-Z]")[[1]],
    str_extract_all(groups[[x]][3], pattern = "[a-zA-Z]")[[1]]
  )
  )
)

## Compute the value of the matching characters
values <- data.frame(letter = c(letters, LETTERS), value = c(1:52))

answer <- sum(match(matches, values$letter))

#! Gold star - done!