#==================================================================
# This scipt allow you to Update gpsr package in desired directory
#==================================================================

require "includes/base_env";
print"
#######################################################################################\n
#\t\tDISCLAIMER AND COPYRIGHT \n\n########################################################################################\n
####    'gpsr' is a free software package: you can redistribute it and/or 
####    modify it under the terms of the GNU General Public License as published 
####    by the Free Software Foundation, either version 3 of the License, or   
####    (at your option) any later version.                                    
####    This program is distributed in the hope that it will be useful,        
####    but WITHOUT ANY WARRANTY; without even the implied warranty of         
####    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the          
####    GNU General Public License for more details.                           
####                                                                           
####    You should have received a copy of the GNU General Public License      
####    along with this program.  If not, see <http://www.gnu.org/licenses/>.  
####----------------------------------------------------------------------------------------------------------
#### Orginally developed at Raghava's group <http://www.imtech.res.in/raghava/> at IMTECH, Chandigarh, India.  
##############################################################################################################\n\n";


print "Do you agree with the term and conditions of the package <yes/no>:";
$terms = <>;
chomp $terms;
if ($terms eq 'yes')
{
print "\nThank you for your interest in gpsr_1.0.\nPlease answer the following questions for proper installation.\nYou are welcome to ignore few quesions but bear in mind that few programs WILL NOT work accordingly!\n\n";



#-------- Ask from user to provide new value --------


print "Enter name of directory for installing GPSR <$gpsr_home>:";
$str = <>;
if(length($str) >= 3){$gpsr_home=$str}

print "Enter perl command with absolute path <$gpsr_perl>:";
$str = <>;
if(length($str) >= 3){$gpsr_perl=$str}

print "Enter svm_classify command of SVM_light package<$gpsr_svm_classify>:";
$str = <>;
if(length($str) >= 3){$gpsr_svm_classify=$str}

print "Enter svm_classify old version of SVM_light package<$gpsr_svm_classify_old>:";
$str = <>;
if(length($str) >= 3){$gpsr_svm_classify_old=$str}

print "Enter full path of BLAST directory having executables  <$gpsr_blast>:";
$str = <>;
if(length($str) >= 3){$gpsr_blast=$str}
chomp($gpsr_blast);
$gpsr_blastpgp = "$gpsr_blast/blastpgp";
$gpsr_makemat = "$gpsr_blast/makemat";
$gpsr_blastdb = "$gpsr_blast/../data";
print "Enter blastpgp commant of blast package <$gpsr_blastpgp>:";
$str = <>;
if(length($str) >= 3){$gpsr_blastpgp=$str}

print "Enter makemat commant (IMPALA) of blast package <$gpsr_makemat>:";
$str = <>;
if(length($str) >= 3){$gpsr_makemat=$str}

print "Enter path of directory having BLAST data  <$gpsr_blastdb>:";
$str = <>;
if(length($str) >= 3){$gpsr_blastdb=$str}

print "Enter psipred with full path <$gpsr_psipred>:";
$str = <>;
if(length($str) >= 3){$gpsr_psipred=$str}

print "Enter meme with full path <$gpsr_meme>:";
$str = <>;
if(length($str) >= 3){$gpsr_meme=$str}

print "Enter mast with full path <$gpsr_mast>:";
$str = <>;
if(length($str) >= 3){$gpsr_mast=$str}



print "Enter psipred data directory path <$gpsr_psidata>:";
$str = <>;
if(length($str) >= 3){$gpsr_psidata=$str}

print "Enter full path of HMMER directory having executables  <$gpsr_hmmer>:";
$str = <>;
if(length($str) >= 3){$gpsr_hmmer=$str}
chomp($gpsr_hmmer);
$gpsr_hmmpfam = "$gpsr_hmmer/hmmpfam";
$gpsr_hmmsearch = "$gpsr_hmmer/hmmsearch";
$gpsr_hmmbuild = "$gpsr_hmmer/hmmbuild";
print "Enter hmmpfam commant of HMMER package <$gpsr_hmmpfam>:";
$str = <>;
if(length($str) >= 3){$gpsr_hmmpfam=$str}

print "Enter hmmsearch commant of HMMER package <$gpsr_hmmsearch>:";
$str = <>;
if(length($str) >= 3){$gpsr_hmmsearch=$str}

print "Enter hmmbuild commant of HMMER package <$gpsr_hmmbuild>:";
$str = <>;
if(length($str) >= 3){$gpsr_hmmbuild=$str}


chomp($gpsr_home);
chomp($gpsr_perl);
chomp($gpsr_svm_classify);
chomp($gpsr_svm_classify_old);
chomp($gpsr_blastpgp);
chomp($gpsr_makemat);
chomp($gpsr_blastdb);
chomp($gpsr_blast);
chomp($gpsr_psidata);
chomp($gpsr_psipred);
chomp($gpsr_hmmpfam);
chomp($gpsr_hmmsearch);
chomp($gpsr_hmmbuild);
chomp($gpsr_meme);
chomp($gpsr_mast);



#----- create directories ----------------
if(!(-e "$gpsr_home")){
    $res = `mkdir $gpsr_home`;
    $res = `mkdir $gpsr_home/bin`;
    $res = `mkdir $gpsr_home/includes`;
    $res = `mkdir $gpsr_home/svm_models`;
    $res = `mkdir $gpsr_home/modules`;
$res = `mkdir $gpsr_home/blast_data`;
}else{
    if(!(-e "$gpsr_home/bin")){
$res = `mkdir $gpsr_home/bin`;
}
    if(!(-e "$gpsr_home/includes")){$res = `mkdir $gpsr_home/includes`;}
    if(!(-e "$gpsr_home/svm_models")){$res = `mkdir $gpsr_home/svm_models`;}
    if(!(-e "$gpsr_home/modules")){$res = `mkdir $gpsr_home/modules`;}

 if(!(-e "$gpsr_home/blast_data")){$res = `mkdir $gpsr_home/blast_data`;}


}

#-------- write base_env ----------------
open(FP,">$gpsr_home/includes/base_env");
print FP "\$gpsr_home=\"$gpsr_home\";\n";
print FP "\$gpsr_perl=\"$gpsr_perl\";\n";
print FP "\$gpsr_svm_classify=\"$gpsr_svm_classify\";\n";
print FP "\$gpsr_svm_classify_old=\"$gpsr_svm_classify_old\";\n";
print FP "\$gpsr_blastpgp=\"$gpsr_blastpgp\";\n";
print FP "\$gpsr_blast=\"$gpsr_blast\";\n";
print FP "\$gpsr_makemat=\"$gpsr_makemat\";\n";
print FP "\$gpsr_blastdb=\"$gpsr_blastdb\";\n";
print FP "\$gpsr_psipred=\"$gpsr_psipred\";\n";
print FP "\$gpsr_hmmer=\"$gpsr_hmmer\";\n";
print FP "\$gpsr_hmmbuild=\"$gpsr_hmmbuild\";\n";
print FP "\$gpsr_hmmsearch=\"$gpsr_hmmsearch\";\n";
print FP "\$gpsr_hmmpfam=\"$gpsr_hmmpfam\";\n";
print FP "\$gpsr_meme=\"$gpsr_meme\";\n";
print FP "\$gpsr_mast=\"$gpsr_mast\";\n";
print FP "\$gpsr_psidata=\"$gpsr_psidata\";\n";


print FP "return 1;\n"; 
close FP;

#===== modify header of perl files ============

opendir(DIR,"src/");
@ti = readdir(DIR);
foreach(@ti){
    $filename=$_;
    if(length($filename) >= 3){
	$file1 = "src/$filename";
	print "$file1\n";
	opendir(DIR1,"$file1");
	@ti1 = readdir(DIR1);
    $count = 0;
foreach(@ti1){
    $filename1 =$_;
    $count++;

if ($filename1 eq "svm_models") 
{ 
$res = `mkdir $gpsr_home/src/svm_models/$filename`; $res = `mv src/$filename/svm_models/* $gpsr_home/src/svm_models/$filename/`;
$res = `rmdir src/$filename/svm_models`;
}

if ($filename1 eq "blast_data") 
{
$res = `mkdir $gpsr_home/src/blast_data/$filename`; $res = `mv src/$filename/blast_data/* $gpsr_home/src/blast_data/$filename/`;
$res = `rmdir src/$filename/blast_data`;
}

if ($filename1 eq "modules")
{
$res = `mkdir $gpsr_home/src/modules/$filename`;    $res = `mv src/$filename/modules/* $gpsr_home/src/modules/$filename/`;
$res = `rmdir src/$filename/modules`;
}
	


	if((index($filename1,".pl") >= 3) && (index($filename1,"~") <= 0)){
	    @fi = split(/\.pl/,$filename1);
	    print "$filename1 : $fi[0]\n";
	    open(FP2,"src/$filename/$filename1");
	    open(FP3,">$gpsr_home/bin/$fi[0]");
	    print FP3 "#!$gpsr_perl \n";
	    print FP3 "require \"$gpsr_home/includes/base_env\";\n";
	    while($t1=<FP2>){
		if(index($t1,"require") <= -1){print FP3 $t1;}
	    }
	    close FP2;
	    close(FP3);
	    $res= `chmod 755 $gpsr_home/bin/$fi[0]`;


	}
    }
    }
}

#--------- Copy Directories --------------

$res = `cp -r src/svm_models/* $gpsr_home/svm_models/`;
$res = `cp -r src/modules/* $gpsr_home/modules/`;
$res = `cp -r src/blast_data/* $gpsr_home/blast_data/`;

print "\nCongratulations! package succeessfully Updated!\n\n";
print "All program executables are installed in '$gpsr_home/bin' directory\n";
print "You can run programs by giving fullpath of the directory or add '$gpsr_home/bin' in your path\n\n";
print "For example: $gpsr_home/bin/fasta2sfasta -i inputFile -o outputFile\n";
}
else {print "Please Type 'yes' or 'no' only!\n"; exit;}

