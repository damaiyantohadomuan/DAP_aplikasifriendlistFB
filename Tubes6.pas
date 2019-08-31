{FILE : APLIKASI DATA FRIENDLIST di FACEBOOK}
{Desc : Menyimpan data Friendlist facebook seorang user dengan rentang 1 bulan dengan beberapa kategori yang diberikan}
{DATE : 30 Maret 2016}
Program TUBES ;
uses crt;


Type WAE        = record // Membuat Tipe bentukan untuk kategori Work And Education
     SD         : string;
     SMP        : string;
     SMA        : string;
     PerguruanTinggi:string;
     Work       : string;
end;
Type CABI       = record // Membuat tipe bentukan untuk kategori Contact And Basic Info
     Nama       :string;
     MobilePhone:string;
     Address    : string;
     Email      : string;
     Gender     : string;
     Interested : string;
     Languange  : string;
     Religion   : string;
     Birthday   : string;
     Umur       : integer;
end;
Type FAR        =record
     Relationship: string; //Membuat tipe bentukan untuk kategori Family and Relationship
     father     :string;
     Mother     :string;
     sister1    :string; //Asumsi dia memiliki 2 saudara perempuan
     sister2    :string;
     Brother1   :string; //Asumsi dia memiliki 2 saudara laki laki
     Brother2   :string;
end;
Type DAA        = record  // Membuat tipe bentukan untuk kategori Detail and About
     About      : string;
     Favorite1  : string; // Asumsi dia memiliki 2 hobi
     Favorite2  : string;
     Favorite3  : string;
end;
Type DATA       = record // Membuat tipe bentukan baru yang membuat beberapa variabel Nama,id dan semua kategori tipe data
     Id :longint;
     WorkAndEducation :WAE;
     ContactAndBasicInfo:CABI;
     FamilyAndRelationship:FAR;
     DetailAndAbout     : DAA;
end;
Type Datagabungan =record
     dataharian : array [1..50] of DATA;
     N2:integer;
end;
Type DATASORT =record    //Gabungan semua data semua hari berupa nama dan umur
     Nama:string;
     umur :integer;
end;
VAR

DATASORTING : array [1..100] of DATASORT;
terurut1 :array[1..100] of integer; //Array berfungsi sebagai sorting umur
terurut2 :array[1..100] of string; //array berfungsi sebagai hasil sorting nama
databulanan:array[1..31]  of Datagabungan ;
pilih:integer;
N1,N3: integer;// N3 digunakan untuk menjumlahkan semua data yang diinputkan dalam semua hari , berfungsi sebagai batas sorting umur
new:string; //digunakan untuk mengisi data update terbaru , digunakan dalam fungsi edit dan delete
newumur:integer;
Tanggal:integer;

//PROSEDURE YANG TERSEDIA
procedure YukInput;forward;
procedure YukSearch;forward;
procedure Yukedit;forward;
procedure Yukdelete;forward;
procedure YukSorting;forward;
procedure YukReport;forward;
procedure YukShowAll;forward;
procedure search1;forward;
procedure search2;forward;
procedure search3;forward;
procedure search4;forward;
procedure edit1;forward;
procedure edit2;forward;
procedure edit3;forward;
procedure edit4;forward;
procedure delete1;forward;
procedure delete2;forward;
procedure sorting1;forward;
procedure sorting2;forward;
procedure ShowAll1;forward;
procedure ShowAll2;forward;



        Procedure MENU ;
        begin
        clrscr;
        Writeln ('----- SELAMAT DATANG DI APLIKASI FRIENDLIST FB-------');
        writeln ('SILAHKAN PILIH ');
        writeln ('1.Input Data');
        writeln ('2.Search Data');
        writeln ('3.Edit Data');
        writeln ('4.Delete Data');
        writeln ('5.Sorting Data');
        writeln ('6.Hasil REPORT data');
        write('PILIH: ');
        readln(pilih);
             case pilih of
                 1:begin
                        YukInput;
                 end;
                 2:begin
                        YukSearch;
                 end;
                 3:begin
                        Yukedit;
                 end;
                 4:begin
                        Yukdelete;
                 end;
                 5:begin
                        YukSorting;
                 end;
                 6:begin
                        YukReport;
                 end;
                 7:begin
                        YukShowAll;
                 end;
                 end;

        end;
        Procedure YukInput ();
        {NOTE : Asumsi ID yang diinputkan user berbeda beda & user hanya menginputkan 1 kali saja }
        var
        i,j :integer;
        begin
        clrscr;
         i:=1;
         j:=1;
         N3:=0;
         write('Masukkan jumlah hari yang anda gunakan dalam range 31 hari :  ');
         readln(N1);

         for i:=1 to N1  do //Batas jumlah hari yang digunakan
                begin
                write('Masukkan jumlah DATA yang anda isi di hari ',i ,': ');
                readln(databulanan[i].N2);
                N3:=N3+(databulanan[i].N2); //jumlah dari semua data yang diinputkan dalam semua hari/tanggal
                writeln('Masukkan data di hari ke ',i);
                writeln('');
                   for j:=1 to (databulanan[i].N2) do   //Batas data teman dalam sehari
                        begin
                        writeln('DATA TEMAN ke ', i ,' pada hari ini ');
                        writeln('*> KATEGORI CONTACT AND BASIC INFO');
                        write('ID:  ');readln(databulanan[i].dataharian[j].id);
                        write('Nama: ');readln(databulanan[i].dataharian[j].ContactAndBasicInfo.Nama);
                        write('Mobile Phone: ');readln(databulanan[i].dataharian[j].ContactAndBasicInfo.MobilePhone);
                        write('Address : ');readln(databulanan[i].dataharian[j].ContactAndBasicInfo.Address);
                        write('Email : ');readln(databulanan[i].dataharian[j].ContactAndBasicInfo.Email);
                        write('Gender : ');readln(databulanan[i].dataharian[j].ContactAndBasicInfo.Gender);
                        write('Interested In: ');readln(databulanan[i].dataharian[j].ContactAndBasicInfo.Interested);
                        write('Languange: ');readln(databulanan[i].dataharian[j].ContactAndBasicInfo.Languange);
                        write('Religion: ');readln(databulanan[i].dataharian[j].ContactAndBasicInfo.Religion);
                        write('Birthday: ');readln(databulanan[i].dataharian[j].ContactAndBasicInfo.Birthday);
                        write('Umur: ');readln(databulanan[i].dataharian[j].ContactAndBasicInfo.Umur);
                        writeln('');
                        writeln('*> KATEGORI WORK AND EDUCATION');
                        write('SD :');readln(databulanan[i].dataharian[j].WorkAndEducation.SD);
                        write('SMP :');readln(databulanan[i].dataharian[j].WorkAndEducation.SMP);
                        write('SMA :');readln( databulanan[i].dataharian[j].WorkAndEducation.SMA);
                        write('Perguruan Tinggi :');readln(databulanan[i].dataharian[j].WorkAndEducation.PerguruanTinggi);
                        writeln('');
                        writeln('*> FAMILY AND RELATIONSHIP');
                        write('Work :');readln(databulanan[i].dataharian[j].FamilyAndRelationship.Sister1);
                        write('Father :');readln(databulanan[i].dataharian[j].FamilyAndRelationship.Father);
                        write('Mother :');readln(databulanan[i].dataharian[j].FamilyAndRelationship.Mother);
                        write('Brother :');readln(databulanan[i].dataharian[j].FamilyAndRelationship.Brother1);
                        write('Sister :');readln(databulanan[i].dataharian[j].FamilyAndRelationship.Brother2);
                        write('Sister :');readln(databulanan[i].dataharian[j].FamilyAndRelationship.Sister1);
                        write('Sister :');readln(databulanan[i].dataharian[j].FamilyAndRelationship.Sister2);
                        write('Relationship :');readln(databulanan[i].dataharian[j].FamilyAndRelationship.Relationship);
                        writeln('');
                        writeln('*> DETAIL AND ABOUT');
                        write('About :');readln(databulanan[i].dataharian[j].DetailAndAbout.About);
                        write('Favorite :');readln(databulanan[i].dataharian[j].DetailAndAbout.Favorite1);
                        write('Favorite :');readln(databulanan[i].dataharian[j].DetailAndAbout.Favorite2);
                        write('Favorite :');readln(databulanan[i].dataharian[j].DetailAndAbout.Favorite3);
                        writeln('');
                        end;
                end;
        writeln('TEKAN 1 jika ingin kembali ke MENU');
        readln(pilih);
        if pilih=1 then
                menu;
        end;
        Procedure YukSearch ();
        begin
        clrscr;
        writeln('Yuk search');
        writeln('Pilih Kategori yang mau diinput');
        writeln('1.Contact And Basic Data');
        writeln('2.Family and Relationship');
        writeln('3.Work and Education');
        writeln('4.Detail and About');
        write('Pilih :');readln(Pilih);
                case pilih of
                1:begin
                        search1; //mencari kategori Contact and Basic Data
                end;
                2:begin
                        search2; //mencari kategori Family and Relationship
                end;
                3:begin
                        search3; //mencari kategori Work And Education
                end;
                4:begin
                        search4; // mencari kategori Detail and About
                end;
                end;
        end;
        Procedure Search1 ();
        var
        ID :longint;
        i,j,x:integer;
        begin
        clrscr;
        i:=1;
        j:=1;
        x:=0;
        writeln('Masukkan ID yang anda cari : ');
        readln(ID);
         While i<=N1 do
         begin
                for j:=1 to (databulanan[i].N2) do
                begin
                if (ID = (databulanan[i].dataharian[j].id)) then
                 begin
                 writeln('Nama : ',databulanan[i].dataharian[j].ContactAndBasicInfo.Nama);
                 writeln('Mobile Phone :', databulanan[i].dataharian[j].ContactAndBasicInfo.MobilePhone);
                 writeln('Address :', databulanan[i].dataharian[j].ContactAndBasicInfo.Address);
                 writeln('Email :',databulanan[i].dataharian[j].ContactAndBasicInfo.Email);
                 writeln('Gender :',databulanan[i].dataharian[j].ContactAndBasicInfo.Gender);
                 writeln('Interested :',databulanan[i].dataharian[j].ContactAndBasicInfo.Interested);
                 writeln('Languange :',databulanan[i].dataharian[j].ContactAndBasicInfo.Languange);
                 writeln('Religion :',databulanan[i].dataharian[j].ContactAndBasicInfo.Religion);
                 writeln('Birthday :',databulanan[i].dataharian[j].ContactAndBasicInfo.Birthday);
                 writeln('Umur :',databulanan[i].dataharian[j].ContactAndBasicInfo.Umur);
                 x:=1;
                 end;
                end;
            i:=i+1;
          end;
         If x=0 then
         writeln('Maaf data tidak ditemukan');
         readln;
         writeln('TEKAN 1 jika ingin kembali ke MENU');
         readln(pilih);
         if pilih=1 then
                menu;
        end;

         Procedure Search2 ();
         var
         ID :longint;
         i,j,x:integer;
         begin
         clrscr;
         i:=1;
         j:=1;
         x:=0;
         writeln('Masukkan ID yang anda cari : ');
         readln(ID);
          While i<=N1 do
          begin
                for j:=1 to (databulanan[i].N2) do
                begin
                        if (ID = (databulanan[i].dataharian[j].id)) then
                                begin
                                         writeln('FATHER : ',databulanan[i].dataharian[j].FamilyAndRelationship.Father);
                                         writeln('MOTHER : ',databulanan[i].dataharian[j].FamilyAndRelationship.Mother);
                                         writeln('BROTHER1 : ',databulanan[i].dataharian[j].FamilyAndRelationship.Brother1);
                                         writeln('BROTHER2 : ',databulanan[i].dataharian[j].FamilyAndRelationship.Brother2);
                                         writeln('SISTER1 : ',databulanan[i].dataharian[j].FamilyAndRelationship.Sister1);
                                         writeln('SISTER2 : ',databulanan[i].dataharian[j].FamilyAndRelationship.Sister2);
                                         writeln('RELATIONSHIP : ',databulanan[i].dataharian[j].FamilyAndRelationship.Relationship);
                                         readln;
                                           x:=1;
                                end;
                 end;
                   i:=i+1;
          end;


         If x=0 then
         writeln('Maaf data tidak ditemukan');
         readln;
         writeln('TEKAN 1 jika ingin kembali ke MENU');
         readln(pilih);
         if pilih=1 then
                menu;
        end;
         procedure search3 ();
         var
         ID :longint;
         i,j,x:integer;
         begin
         clrscr;
         i:=1;
         j:=1;
         x:=0;
         writeln('Masukkan ID yang anda cari : ');
         readln(ID);
          While i<=N1 do
          begin
                for j:=1 to (databulanan[i].N2) do
                begin
                        if (ID = (databulanan[i].dataharian[j].id)) then
                        begin
                                writeln('SD :',databulanan[i].dataharian[j].WorkAndEducation.SD);
                                writeln('SMP :',databulanan[i].dataharian[j].WorkAndEducation.SMP);
                                writeln('SMA :', databulanan[i].dataharian[j].WorkAndEducation.SMA);
                                writeln('Perguruan Tinggi :',databulanan[i].dataharian[j].WorkAndEducation.PerguruanTinggi);
                                writeln('Work :',databulanan[i].dataharian[j].FamilyAndRelationship.Sister1);
                                readln;
                                x:=1;
                         end;
                end;
                i:=i+1;
          end;
         If x=0 then
         writeln('Maaf data tidak ditemukan');
         readln;
         writeln('TEKAN 1 jika ingin kembali ke MENU');
         readln(pilih);
         if pilih=1 then
                menu;
        end;
         Procedure Search4 ();
         var
         ID :longint;
         i,j,x:integer;
         begin
         clrscr;
         i:=1;
         j:=1;
         x:=0;
         writeln('Masukkan ID yang anda cari : ');
         readln(ID);
          While i<=N1 do
          begin
                for j:=1 to (databulanan[i].N2) do
                        begin
                                if (ID = (databulanan[i].dataharian[j].id)) then
                                        begin
                                         writeln('ABOUT : ',databulanan[i].dataharian[j].DetailAndAbout.About);
                                         writeln('FAVORITE1 : ',databulanan[i].dataharian[j].DetailAndAbout.Favorite1);
                                         writeln('FAVORITE2 : ',databulanan[i].dataharian[j].DetailAndAbout.Favorite2);
                                         writeln('FAVORITE3 : ',databulanan[i].dataharian[j].DetailAndAbout.Favorite3);
                                         readln;
                                          x:=1;
                                        end;
                        end;
           i:=i+1;
          end;

         If x=0 then
         writeln('Maaf data tidak ditemukan');
         readln;
         writeln('TEKAN 1 jika ingin kembali ke MENU');
         readln(pilih);
         if pilih=1 then
                menu;
        end;
        Procedure YukEdit ();
        begin
        clrscr;
        writeln('Yuk Edit ');
        writeln('Pilih Kategori yang mau diedit');
        writeln('1.Contact And Basic Data');
        writeln('2.Family and Relationship');
        writeln('3.Work and Education');
        writeln('4.Detail and About');
        write('Pilih :');readln(Pilih);
                case pilih of
                1:begin
                        edit1; //mengedit kategori Contact and Basic Data
                end;
                2:begin
                        edit2;// mengedit kategori FamilyAndRelationship
                end;
                3:begin
                        edit3;// mengedit kategori WorkAndEducation
                end;
                4:begin
                        edit4;//mengedit  kategori DetailAndAbout

                end;
                end;
        end;
        procedure edit1 ();
         var
         ID :longint;
         i,j,x:integer;
         begin
         clrscr;
         i:=1;
         j:=1;
         x:=0;
         writeln('Bagian mana yang mau anda edit');
         writeln('1.NAMA');
         writeln('2.PHONE');
         writeln('3.ADDRESS');
         writeln('4.EMAIL');
         writeln('5.GENDER');
         writeln('6.Interested in');
         writeln('7.Languange');
         writeln('8.Religion');
         writeln('9.Birthday');
         writeln('10.Umur');
         write('PILIH: ');
         readln(pilih);
                case pilih of
                1:begin
                        write('masukkan ID : ');
                        readln(ID);
                        While i<=N1 do
                        begin
                                for j:=1 to (databulanan[i].N2) do
                                begin
                                        if (ID = (databulanan[i].dataharian[j].id)) then
                                        begin
                                        writeln('NAMA SEBELUMNYA : ', databulanan[i].dataharian[j].ContactAndBasicInfo.Nama);readln;
                                        write('Masukkan Nama BARU : ');
                                        readln(new);
                                        databulanan[i].dataharian[j].ContactAndBasicInfo.Nama:=new;
                                        x:=1;
                                        end;
                                 end;
                        i:=i+1;
                        end;
                end;
                2:begin
                        write('masukkan ID : ');
                        readln(ID);
                        While i<=N1 do
                        begin
                                for j:=1 to (databulanan[i].N2) do
                                begin
                                        if (ID = (databulanan[i].dataharian[j].id)) then
                                        begin
                                        writeln('Mobile Phone sebelumnya : ', databulanan[i].dataharian[j].ContactAndBasicInfo.MobilePhone);readln;
                                        write('Masukkan Mobile Phone BARU : ');
                                        readln(new);
                                        databulanan[i].dataharian[j].ContactAndBasicInfo.MobilePhone:=new;
                                        x:=1;
                                        end;
                                end;
                        i:=i+1;
                        end;
                end;
                3:begin
                        write('masukkan ID : ');
                        readln(ID);
                        While i<=N1 do
                        begin
                                for j:=1 to (databulanan[i].N2) do
                                begin
                                        if (ID = (databulanan[i].dataharian[j].id)) then
                                        begin
                                        writeln('Address sebelumnya : ', databulanan[i].dataharian[j].ContactAndBasicInfo.Address);readln;
                                        write('Masukkan Address BARU : ');
                                        readln(new);
                                        databulanan[i].dataharian[j].ContactAndBasicInfo.Address:=new;
                                        x:=1;
                                        end;
                                end;
                        i:=i+1;
                        end;
                end;
                4:begin
                        write('masukkan ID : ');
                        readln(ID);
                        While i<=N1 do
                        begin
                                for j:=1 to (databulanan[i].N2) do
                                begin
                                        if (ID = (databulanan[i].dataharian[j].id)) then
                                        begin
                                        writeln('Email sebelumnya : ', databulanan[i].dataharian[j].ContactAndBasicInfo.Email);readln;
                                        write('Masukkan email BARU : ');
                                        readln(new);
                                        databulanan[i].dataharian[j].ContactAndBasicInfo.Email:=new;
                                        x:=1;
                                        end;
                                end;
                        i:=i+1;
                        end;
                end;
                5:begin
                        write('masukkan ID : ');
                        readln(ID);
                        While i<=N1 do
                        begin
                                for j:=1 to (databulanan[i].N2) do
                                begin
                                        if (ID = (databulanan[i].dataharian[j].id)) then
                                        begin
                                        writeln('Gender sebelumnya : ', databulanan[i].dataharian[j].ContactAndBasicInfo.Gender);readln;
                                        write('Masukkan Gender BARU : ');
                                        readln(new);
                                        databulanan[i].dataharian[j].ContactAndBasicInfo.Gender:=new;
                                        x:=1;
                                        end;
                                end;
                        i:=i+1;
                        end;
                end;
                6:begin
                        write('masukkan ID : ');
                        readln(ID);
                        While i<=N1 do
                        begin
                                for j:=1 to (databulanan[i].N2) do
                                begin
                                        if (ID = (databulanan[i].dataharian[j].id)) then
                                        begin
                                        writeln('Interested sebelumnya : ', databulanan[i].dataharian[j].ContactAndBasicInfo.Interested);readln;
                                        write('Masukkan Interested in BARU : ');
                                        readln(new);
                                        databulanan[i].dataharian[j].ContactAndBasicInfo.Interested:=new;
                                        x:=1;
                                        end;
                                end;
                        i:=i+1;
                        end;
                end;
                7:begin
                        write('masukkan ID : ');
                        readln(ID);
                        While i<=N1 do
                        begin
                                for j:=1 to (databulanan[i].N2) do
                                begin
                                        if (ID = (databulanan[i].dataharian[j].id)) then
                                        begin
                                        writeln('Languange sebelumnya : ', databulanan[i].dataharian[j].ContactAndBasicInfo.Languange);readln;
                                        write('Masukkan Languange BARU : ');
                                        readln(new);
                                        databulanan[i].dataharian[j].ContactAndBasicInfo.Languange:=new;
                                        x:=1;
                                        end;
                                end;
                        i:=i+1;
                        end;
                end;
                8:begin
                        write('masukkan ID : ');
                        readln(ID);
                        While i<=N1 do
                        begin
                                for j:=1 to(databulanan[i].N2) do
                                begin
                                        if (ID = (databulanan[i].dataharian[j].id)) then
                                        begin
                                        writeln('religion sebelumnya : ', databulanan[i].dataharian[j].ContactAndBasicInfo.Religion);readln;
                                        write('Masukkan Religion BARU : ');
                                        readln(new);
                                        databulanan[i].dataharian[j].ContactAndBasicInfo.Religion:=new;
                                        x:=1;
                                        end;
                                end;
                        i:=i+1;
                        end;
                end;
                 9:begin
                        write('masukkan ID : ');
                        readln(ID);
                        While i<=N1 do
                        begin
                                for j:=1 to (databulanan[i].N2) do
                                begin
                                        if (ID = (databulanan[i].dataharian[j].id)) then
                                        begin
                                        writeln('Birthday sebelumnya : ', databulanan[i].dataharian[j].ContactAndBasicInfo.Birthday);readln;
                                        write('Masukkan Birthday baru : ');
                                        readln(new);
                                        databulanan[i].dataharian[j].ContactAndBasicInfo.Birthday:=new;
                                        x:=1;
                                        end;
                                end;
                        i:=i+1;
                        end;
                 end;
                 10:begin
                        write('masukkan ID : ');
                        readln(ID);
                        While i<=N1 do
                        begin
                                for j:=1 to (databulanan[i].N2) do
                                begin
                                        if (ID = (databulanan[i].dataharian[j].id)) then
                                        begin
                                        writeln('Umur sebelumnya: ', databulanan[i].dataharian[j].ContactAndBasicInfo.umur);readln;
                                        write('Masukkan Umur BARU : ');
                                        readln(newumur);
                                        databulanan[i].dataharian[j].ContactAndBasicInfo.umur:=newumur;
                                        x:=1;
                                        end;
                                end;
                        i:=i+1;
                        end;
                  end;
                  end;
         If x=0 then
         writeln('Maaf data tidak ditemukan');
         readln;
         writeln('TEKAN 1 jika ingin kembali ke MENU');
         readln(pilih);
         if pilih=1 then
                menu;
        end;

         procedure edit2 ();
         var
         ID :longint;
         i,j,x:integer;
         begin
         clrscr;
         i:=1;
         j:=1;
         x:=0;
         writeln('Bagian mana yang mau anda edit');
         writeln('1.FATHER');
         writeln('2.MOTHER');
         writeln('3.BROTHER1');
         writeln('4.BROTHER2');
         writeln('5.SISTER1');
         writeln('6.SISTER2');
         writeln('7.RELATIONSHIP');
         write('PILIH : ');
         readln(pilih);
                case pilih of
                  1:begin
                        write('masukkan ID : ');
                        readln(ID);
                        While i<=N1 do
                        begin
                                for j:=1 to (databulanan[i].N2) do
                                begin
                                        if (ID = (databulanan[i].dataharian[j].id)) then
                                        begin
                                        writeln('FATHER sebelumnya: ', databulanan[i].dataharian[j].FamilyAndRelationship.father);readln;
                                        write('Masukkan Father BARU : ');
                                        readln(new);
                                        databulanan[i].dataharian[j].FamilyAndRelationship.father:=new;
                                        x:=1;
                                        end;
                                end;
                        i:=i+1;
                        end;
                   end;
                   2:begin
                        write('masukkan ID : ');
                        readln(ID);
                        While i<=N1 do
                        begin
                                for j:=1 to (databulanan[i].N2) do
                                begin
                                        if (ID = (databulanan[i].dataharian[j].id)) then
                                        begin
                                        writeln('MOTHER sebelumnya: ', databulanan[i].dataharian[j].FamilyAndRelationship.mother);readln;
                                        write('Masukkan Father BARU : ');
                                        readln(new);
                                        databulanan[i].dataharian[j].FamilyAndRelationship.mother:=new;
                                        x:=1;
                                        end;
                                end;
                        i:=i+1;
                        end;
                   end;
                   3:begin
                        write('masukkan ID : ');
                        readln(ID);
                        While i<=N1 do
                        begin
                                for j:=1 to (databulanan[i].N2) do
                                begin
                                        if (ID = (databulanan[i].dataharian[j].id)) then
                                        begin
                                        writeln('BROHTER1 sebelumnya: ', databulanan[i].dataharian[j].FamilyAndRelationship.brother1);readln;
                                        write('Masukkan Brother1 BARU : ');
                                        readln(new);
                                        databulanan[i].dataharian[j].FamilyAndRelationship.brother1:=new;
                                        x:=1;
                                        end;
                                end;
                        i:=i+1;
                        end;
                   end;
                   4:begin
                        write('masukkan ID : ');
                        readln(ID);
                        While i<=N1 do
                        begin
                                for j:=1 to (databulanan[i].N2) do
                                begin
                                        if (ID = (databulanan[i].dataharian[j].id)) then
                                        begin
                                        writeln('BROHTER2 sebelumnya: ', databulanan[i].dataharian[j].FamilyAndRelationship.brother2);readln;
                                        write('Masukkan Brother2 BARU : ');
                                        readln(new);
                                        databulanan[i].dataharian[j].FamilyAndRelationship.brother2:=new;
                                        x:=1;
                                        end;
                                end;
                        i:=i+1;
                        end;
                   end;
                   5:begin
                        write('masukkan ID : ');
                        readln(ID);
                        While i<=N1 do
                        begin
                                for j:=1 to (databulanan[i].N2) do
                                begin
                                        if (ID = (databulanan[i].dataharian[j].id)) then
                                        begin
                                        writeln('SISTER1 sebelumnya: ', databulanan[i].dataharian[j].FamilyAndRelationship.sister1);readln;
                                        write('Masukkan sister1 BARU : ');
                                        readln(new);
                                        databulanan[i].dataharian[j].FamilyAndRelationship.sister1:=new;
                                        x:=1;
                                        end;
                                end;
                        i:=i+1;
                        end;
                   end;
                   6:begin
                        write('masukkan ID : ');
                        readln(ID);
                        While i<=N1 do
                        begin
                                for j:=1 to (databulanan[i].N2) do
                                begin
                                        if (ID = (databulanan[i].dataharian[j].id)) then
                                        begin
                                        writeln('SISTER2 sebelumnya: ', databulanan[i].dataharian[j].FamilyAndRelationship.sister2);readln;
                                        write('Masukkan sister2 BARU : ');
                                        readln(new);
                                        databulanan[i].dataharian[j].FamilyAndRelationship.sister2:=new;
                                        x:=1;
                                        end;
                                end;
                        i:=i+1;
                        end;
                   end;
                   7:begin
                        write('masukkan ID : ');
                        readln(ID);
                        While i<=N1 do
                        begin
                                for j:=1 to (databulanan[i].N2) do
                                begin
                                        if (ID = (databulanan[i].dataharian[j].id)) then
                                        begin
                                        writeln('RELATIONSHIP sebelumnya: ', databulanan[i].dataharian[j].FamilyAndRelationship.relationship);readln;
                                        write('Masukkan relationship BARU : ');
                                        readln(new);
                                        databulanan[i].dataharian[j].FamilyAndRelationship.relationship:=new;
                                        x:=1;
                                        end;
                                end;
                        i:=i+1;
                        end;
                   end;
                   end;
         If x=0 then
         writeln('Maaf data tidak ditemukan');
         readln;
         writeln('TEKAN 1 jika ingin kembali ke MENU');
         readln(pilih);
         if pilih=1 then
                menu;
        end;

        procedure edit3 ();
        var
         ID :longint;
         i,j,x:integer;
        begin
         clrscr;
         i:=1;
         j:=1;
         x:=0;
         writeln('Bagian mana yang mau anda edit');
         writeln('1.SD');
         writeln('2.SMP');
         writeln('3.SMA');
         writeln('4.PERGURUAN TINGGI');
         writeln('5.WORK');

         write('PILIH : ');
         readln(pilih);
                case pilih of
                  1:begin
                        write('masukkan ID : ');
                        readln(ID);
                        While i<=N1 do
                        begin
                                for j:=1 to (databulanan[i].N2) do
                                begin
                                        if (ID = (databulanan[i].dataharian[j].id)) then
                                        begin
                                        writeln('SD sebelumnya: ', databulanan[i].dataharian[j].WorkAndEducation.SD);readln;
                                        write('Masukkan SD BARU : ');
                                        readln(new);
                                        databulanan[i].dataharian[j].WorkAndEducation.SD:=new;
                                        x:=1;
                                        end;
                                end;
                        i:=i+1;
                        end;
                   end;
                   2:begin
                        write('masukkan ID : ');
                        readln(ID);
                        While i<=N1 do
                        begin
                                for j:=1 to (databulanan[i].N2) do
                                begin
                                        if (ID = (databulanan[i].dataharian[j].id)) then
                                        begin
                                        writeln('SMP sebelumnya: ', databulanan[i].dataharian[j].WorkAndEducation.SMP);readln;
                                        write('Masukkan SMP BARU : ');
                                        readln(new);
                                        databulanan[i].dataharian[j].WorkAndEducation.SMP:=new;
                                        x:=1;
                                        end;
                                end;
                        i:=i+1;
                        end;
                   end;
                   3:begin
                        write('masukkan ID : ');
                        readln(ID);
                        While i<=N1 do
                        begin
                                for j:=1 to (databulanan[i].N2) do
                                begin
                                        if (ID = (databulanan[i].dataharian[j].id)) then
                                        begin
                                        writeln('SMA sebelumnya: ', databulanan[i].dataharian[j].WorkAndEducation.SMA);readln;
                                        write('Masukkan SMA BARU : ');
                                        readln(new);
                                        databulanan[i].dataharian[j].WorkAndEducation.SMA:=new;
                                        x:=1;
                                        end;
                                end;
                        i:=i+1;
                        end;
                   end;
                   4:begin
                        write('masukkan ID : ');
                        readln(ID);
                        While i<=N1 do
                        begin
                                for j:=1 to (databulanan[i].N2) do
                                begin
                                        if (ID = (databulanan[i].dataharian[j].id)) then
                                        begin
                                        writeln('Perguruan Tinggi sebelumnya: ', databulanan[i].dataharian[j].WorkAndEducation.PerguruanTinggi);readln;
                                        write('Masukkan Perguruan Tinggi BARU : ');
                                        readln(new);
                                        databulanan[i].dataharian[j].WorkAndEducation.PerguruanTinggi:=new;
                                        x:=1;
                                        end;
                                end;
                        i:=i+1;
                        end;
                   end;
                   5:begin
                        write('masukkan ID : ');
                        readln(ID);
                        While i<=N1 do
                        begin
                                for j:=1 to (databulanan[i].N2) do
                                begin
                                        if (ID = (databulanan[i].dataharian[j].id)) then
                                        begin
                                        writeln('Work sebelumnya: ', databulanan[i].dataharian[j].WorkAndEducation.Work);readln;
                                        write('Masukkan Work BARU : ');
                                        readln(new);
                                        databulanan[i].dataharian[j].WorkAndEducation.Work:=new;
                                        x:=1;
                                        end;
                                end;
                        i:=i+1;
                        end;
                   end;
                   end;
         end;
        procedure edit4 ();
        var
         ID :longint;
         i,j,x:integer;
        begin
         clrscr;
         i:=1;
         j:=1;
         x:=0;
         writeln('Bagian mana yang mau anda edit');
         writeln('1.About');
         writeln('2.Favorite1');
         writeln('3.Favorite2');
         writeln('4.Favorite3');
         write('PILIH : ');
         readln(pilih);
                case pilih of
                  1:begin
                        write('masukkan ID : ');
                        readln(ID);
                        While i<=N1 do
                        begin
                                for j:=1 to (databulanan[i].N2) do
                                begin
                                        if (ID = (databulanan[i].dataharian[j].id)) then
                                        begin
                                        writeln('About sebelumnya: ', databulanan[i].dataharian[j].DetailAndAbout.About);readln;
                                        write('Masukkan About  BARU : ');
                                        readln(new);
                                        databulanan[i].dataharian[j].DetailAndAbout.About:=new;
                                        x:=1;
                                        end;
                                end;
                        i:=i+1;
                        end;
                   end;
                   2:begin
                        write('masukkan ID : ');
                        readln(ID);
                        While i<=N1 do
                        begin
                                for j:=1 to (databulanan[i].N2) do
                                begin
                                        if (ID = (databulanan[i].dataharian[j].id)) then
                                        begin
                                        writeln('Favorite1 sebelumnya: ', databulanan[i].dataharian[j].DetailAndAbout.Favorite1);readln;
                                        write('Masukkan Favorite1  BARU : ');
                                        readln(new);
                                        databulanan[i].dataharian[j].DetailAndAbout.Favorite1:=new;
                                        x:=1;
                                        end;
                                end;
                        i:=i+1;
                        end;
                   end;
                   3:begin
                        write('masukkan ID : ');
                        readln(ID);
                        While i<=N1 do
                        begin
                                for j:=1 to (databulanan[i].N2) do
                                begin
                                        if (ID = (databulanan[i].dataharian[j].id)) then
                                        begin
                                        writeln('favorite2 sebelumnya: ', databulanan[i].dataharian[j].DetailAndAbout.favorite2);readln;
                                        write('Masukkan favorite2 BARU : ');
                                        readln(new);
                                        databulanan[i].dataharian[j].DetailAndAbout.favorite2:=new;
                                        x:=1;
                                        end;
                                end;
                        i:=i+1;
                        end;
                   end;
                   4:begin
                        write('masukkan ID : ');
                        readln(ID);
                        While i<=N1 do
                        begin
                                for j:=1 to (databulanan[i].N2) do
                                begin
                                        if (ID = (databulanan[i].dataharian[j].id)) then
                                        begin
                                        writeln('favorite 3 sebelumnya: ', databulanan[i].dataharian[j].DetailAndAbout.favorite3);readln;
                                        write('Masukkan favorite3  BARU : ');
                                        readln(new);
                                        databulanan[i].dataharian[j].DetailAndAbout.favorite3:=new;
                                        x:=1;
                                        end;
                                end;
                        i:=i+1;
                        end;
                   end;
                   end;
         If x=0 then
         writeln('Maaf data tidak ditemukan');
         readln;
         writeln('TEKAN 1 jika ingin kembali ke MENU');
         readln(pilih);
         if pilih=1 then
                menu;
        end;

        Procedure YukDelete;
        begin

        writeln('1.Mendelete semua data anggota pada hari tertentu');
        writeln('2.Mendelete data anggota tertentu pada hari tertentu');
        write('pilih fitur delete : ');
        readln(pilih);
        readln;
                case pilih of
                1:begin
                        delete1;
                end;
                2:begin
                        delete2;
                end;
                end;
        end;
        Procedure delete1;
        var
        j:integer;
        begin
                j:=1;
                write('Masukkan tanggal yang datanya ingin dihapuskan secara keseluruhan :');
                readln(tanggal);
                for j:=1 to (databulanan[tanggal].N2) do
                        begin
                        new:=('DATA TERHAPUS');
                        newumur := 0;
                        writeln(databulanan[tanggal].dataharian[j].id);
                        (databulanan[tanggal].dataharian[j].ContactAndBasicInfo.Nama):=new;
                        (databulanan[tanggal].dataharian[j].ContactAndBasicInfo.MobilePhone):=new;
                        (databulanan[tanggal].dataharian[j].ContactAndBasicInfo.Address):=new;
                        (databulanan[tanggal].dataharian[j].ContactAndBasicInfo.Email):=new;
                        (databulanan[tanggal].dataharian[j].ContactAndBasicInfo.Gender):=new;
                        (databulanan[tanggal].dataharian[j].ContactAndBasicInfo.Interested):=new; ;
                        (databulanan[tanggal].dataharian[j].ContactAndBasicInfo.Languange):=new;
                        (databulanan[tanggal].dataharian[j].ContactAndBasicInfo.Religion):=new;
                        (databulanan[tanggal].dataharian[j].ContactAndBasicInfo.Birthday):=new;
                        (databulanan[tanggal].dataharian[j].ContactAndBasicInfo.Umur):=newumur;
                        (databulanan[tanggal].dataharian[j].WorkAndEducation.SD):=new;
                        (databulanan[tanggal].dataharian[j].WorkAndEducation.SMP):=new;
                        (databulanan[tanggal].dataharian[j].WorkAndEducation.SMA):=new;
                        (databulanan[tanggal].dataharian[j].WorkAndEducation.PerguruanTinggi):=new;
                        (databulanan[tanggal].dataharian[j].FamilyAndRelationship.Sister1):=new;
                        (databulanan[tanggal].dataharian[j].FamilyAndRelationship.Father):=new;
                        (databulanan[tanggal].dataharian[j].FamilyAndRelationship.Mother):=new;
                        (databulanan[tanggal].dataharian[j].FamilyAndRelationship.Brother1):=new;
                        (databulanan[tanggal].dataharian[j].FamilyAndRelationship.Brother2):=new;
                        (databulanan[tanggal].dataharian[j].FamilyAndRelationship.Sister1):=new;
                        (databulanan[tanggal].dataharian[j].FamilyAndRelationship.Sister2):=new;
                        (databulanan[tanggal].dataharian[j].FamilyAndRelationship.Relationship):=new;
                        (databulanan[tanggal].dataharian[j].DetailAndAbout.About):=new;
                        (databulanan[tanggal].dataharian[j].DetailAndAbout.Favorite1):=new;
                        (databulanan[tanggal].dataharian[j].DetailAndAbout.Favorite2):=new;
                        (databulanan[tanggal].dataharian[j].DetailAndAbout.Favorite3):=new;
                         writeln('');
                        end;
         writeln('TEKAN 1 jika ingin kembali ke MENU');
         readln(pilih);
         if pilih=1 then
                menu;
        end;
        Procedure delete2;
        var
        j:integer;
        ID:integer;
        x:integer;
        begin
                x:=0;
                j:=1;
                write('Masukkan tanggal  : ');
                readln(tanggal);
                writeln('ID yang ada pada tanggal ' , tanggal ,' adalah ');
                for j:=1 to (databulanan[tanggal].N2) do
                        begin

                        writeln('=>',databulanan[tanggal].dataharian[j].id);
                        end;
                new:=('DATA TERHAPUS');
                newumur := 0;
                write('Masukkan ID yang anda ingin hapus datanya : ');
                readln(ID);
                For j:=1 to (databulanan[tanggal].N2) do
                        begin
                        if ID=(databulanan[tanggal].dataharian[j].id) then
                        (databulanan[tanggal].dataharian[j].ContactAndBasicInfo.Nama):=new;
                        (databulanan[tanggal].dataharian[j].ContactAndBasicInfo.MobilePhone):=new;
                        (databulanan[tanggal].dataharian[j].ContactAndBasicInfo.Address):=new;
                        (databulanan[tanggal].dataharian[j].ContactAndBasicInfo.Email):=new;
                        (databulanan[tanggal].dataharian[j].ContactAndBasicInfo.Gender):=new;
                        (databulanan[tanggal].dataharian[j].ContactAndBasicInfo.Interested):=new; ;
                        (databulanan[tanggal].dataharian[j].ContactAndBasicInfo.Languange):=new;
                        (databulanan[tanggal].dataharian[j].ContactAndBasicInfo.Religion):=new;
                        (databulanan[tanggal].dataharian[j].ContactAndBasicInfo.Birthday):=new;
                        (databulanan[tanggal].dataharian[j].ContactAndBasicInfo.Umur):=newumur;
                        (databulanan[tanggal].dataharian[j].WorkAndEducation.SD):=new;
                        (databulanan[tanggal].dataharian[j].WorkAndEducation.SMP):=new;
                        (databulanan[tanggal].dataharian[j].WorkAndEducation.SMA):=new;
                        (databulanan[tanggal].dataharian[j].WorkAndEducation.PerguruanTinggi):=new;
                        (databulanan[tanggal].dataharian[j].FamilyAndRelationship.Sister1):=new;
                        (databulanan[tanggal].dataharian[j].FamilyAndRelationship.Father):=new;
                        (databulanan[tanggal].dataharian[j].FamilyAndRelationship.Mother):=new;
                        (databulanan[tanggal].dataharian[j].FamilyAndRelationship.Brother1):=new;
                        (databulanan[tanggal].dataharian[j].FamilyAndRelationship.Brother2):=new;
                        (databulanan[tanggal].dataharian[j].FamilyAndRelationship.Sister1):=new;
                        (databulanan[tanggal].dataharian[j].FamilyAndRelationship.Sister2):=new;
                        (databulanan[tanggal].dataharian[j].FamilyAndRelationship.Relationship):=new;
                        (databulanan[tanggal].dataharian[j].DetailAndAbout.About):=new;
                        (databulanan[tanggal].dataharian[j].DetailAndAbout.Favorite1):=new;
                        (databulanan[tanggal].dataharian[j].DetailAndAbout.Favorite2):=new;
                        (databulanan[tanggal].dataharian[j].DetailAndAbout.Favorite3):=new;
                         writeln('');
                         x:=1;
                        end;
         if x=0 then
                writeln('ID yang anda masukkan tidak ada pada tanggal yang ditentukkan');
                readln;
         writeln('TEKAN 1 jika ingin kembali ke MENU');
         readln(pilih);
         if pilih=1 then
                menu;
        end;

        procedure YukReport;
        var
        i,x :integer;
        begin
                x:=0;
                writeln('HASIL REPORT BERDASARKAN JUMLAH TEMAN YANG DITAMBAHKAN SETIAP HARINYA');
                readln;
                for i:=1 to N1  do
                begin

                        writeln('Tanggal ' , i , ' : ' , databulanan[i].N2 , ' teman ');
                        writeln(' ');
                        x:=1;
                        readln;
                end;
        If x=0 then
                begin
                writeln('ANDA BELUM MENGINPUTKAN DATA');readln;
                end;
        writeln('TEKAN 1 jika ingin kembali ke MENU');
        readln(pilih);
        if pilih=1 then
                menu;
        end;
        procedure YukSorting;
        begin
                writeln('MENU SORTING');
                writeln('1.BERDASARKAN UMUR , dari yang MUDA ke TUA');
                writeln('2.BERDASARKAN UMUR , dari yang TUA ke MUDA');
                write('PILIH : ');
                readln(pilih);
                        case pilih of
                        1:begin
                                Sorting1;
                        end;
                        2:begin
                                Sorting2;
                        end;
                        end;
        end;
        procedure Sorting1;
        var
        i,j,x,k :integer;
        begin
                k:=1;
                x:=0;
                i:=1;
                j:=1;
                for i:=1 to N1 do
                begin
                        for j:=1 to (databulanan[i].N2) do
                        begin
                        DATASORTING[k].umur := databulanan[i].dataharian[j].ContactAndBasicInfo.umur;
                        DATASORTING[k].nama := databulanan[i].dataharian[j].ContactAndBasicInfo.nama;
                        k:=k+1;
                        end;
                end;

                for i:=1 to N3 do
                    begin
                        terurut1[i]:=0;
                    end;
                for i:=1 to N3 do
                   begin
                        terurut1[DATASORTING[i].umur]:= terurut1[DATASORTING[i].umur]+1;
                   end;

                writeln('MAKA DATA TERURUT DARI UMUR TERMUDA HINGGA TERTUA adalah : ' ); readln;

                for i:=1 to N3 do
                begin
                        if terurut1[i]>0 then
                                        for j:=1 to terurut1[i] do
                                         begin
                                         write('NAMA : ' ,  DATASORTING[i].nama ,' => UMUR : ' , i);readln;
                                         x:=1;
                                         end;

                end;
        if x=0 then
                begin
                writeln('MAAF ANDA BELUM MENGINPUTKAN DATA');readln;
                end;
        writeln('TEKAN 1 jika ingin kembali ke MENU');
        readln(pilih);
        if pilih=1 then
                menu;
        end;
        Procedure sorting2;
        var
        i,j,x,k :integer;
        begin
                i:=1;
                j:=1;
                x:=0;
                k:=1;
                for i:=1 to N1 do
                begin
                        for j:=1 to databulanan[i].N2 do
                        begin
                        DATASORTING[k].umur := databulanan[i].dataharian[j].ContactAndBasicInfo.umur;
                        DATASORTING[k].nama := databulanan[i].dataharian[j].ContactAndBasicInfo.nama;
                        k:=k+1;
                        end;

                end;
                for i:=1 to N3 do
                    begin
                        terurut1[i]:=0;
                    end;
                for i:=1 to N3 do
                   begin
                        terurut1[DATASORTING[i].umur]:= terurut1[DATASORTING[i].umur]+1;
                   end;

                writeln('MAKA DATA TERURUT DARI UMUR TERTUA hingga TERMUDA adalah : ' ); readln;

                for i:=N3 downto 1 do
                begin
                        if terurut1[i]>0 then
                                        for j:=1 to terurut1[i] do
                                         begin
                                         write(' NAMA : ' ,  DATASORTING[i].nama ,' => UMUR : ',i,' tahun ');readln;
                                         x:=1;
                                         end;

                end;
        if x=0 then
                begin
                writeln('MAAF ANDA BELUM MENGINPUTKAN DATA');readln;
                end;
        writeln('TEKAN 1 jika ingin kembali ke MENU');
        readln(pilih);
        if pilih=1 then
                menu;
        end;
        Procedure YukShowAll;
        begin
                writeln('MENU SHOWALL');
                writeln('1.Menshow semua data semua hari');
                writeln('2.Menshow semua data pada hari tertentu');
                write('PILIH');readln(pilih);
                case pilih of
                1:begin
                        Showall1;
                end;
                2:begin
                        ShowAll2;
                end;
                end;
        end;
        Procedure ShowAll1;
        var
        i,j,x:integer;
        begin
                x:=0;
                writeln('Tanggal');readln(Tanggal);
                writeln('DATA SEMUA pada tanggal ',Tanggal);readln;
                for j:=1 to (databulanan[tanggal].N2) do
                begin
                        writeln('DATA TEMAN ke ', j ,' pada hari ini ');
                        writeln('*> KATEGORI CONTACT AND BASIC INFO');
                        writeln('ID:  ' , databulanan[tanggal].dataharian[j].id);
                        writeln('Nama: ' ,databulanan[tanggal].dataharian[j].ContactAndBasicInfo.Nama);
                        writeln('Mobile Phone: ',databulanan[tanggal].dataharian[j].ContactAndBasicInfo.MobilePhone);
                        writeln('Address : ', databulanan[tanggal].dataharian[j].ContactAndBasicInfo.Address);
                        writeln('Email : ', databulanan[tanggal].dataharian[j].ContactAndBasicInfo.Email);
                        writeln('Gender : ', databulanan[tanggal].dataharian[j].ContactAndBasicInfo.Gender);
                        writeln('Interested In: ',databulanan[tanggal].dataharian[j].ContactAndBasicInfo.Interested);
                        writeln('Languange: ', databulanan[tanggal].dataharian[j].ContactAndBasicInfo.Languange);
                        writeln('Religion: ', databulanan[tanggal].dataharian[j].ContactAndBasicInfo.Religion);
                        writeln('Birthday: ', databulanan[tanggal].dataharian[j].ContactAndBasicInfo.Birthday);
                        writeln('Umur: ', databulanan[tanggal].dataharian[j].ContactAndBasicInfo.Umur);
                        writeln('');
                        writeln('*> KATEGORI WORK AND EDUCATION');
                        writeln('SD :', databulanan[tanggal].dataharian[j].WorkAndEducation.SD);
                        writeln('SMP :', databulanan[tanggal].dataharian[j].WorkAndEducation.SMP);
                        writeln('SMA :',  databulanan[tanggal].dataharian[j].WorkAndEducation.SMA);
                        writeln('Perguruan Tinggi :',databulanan[tanggal].dataharian[j].WorkAndEducation.PerguruanTinggi);
                        writeln('');
                        writeln('*> FAMILY AND RELATIONSHIP');
                        writeln('Work :', databulanan[tanggal].dataharian[j].FamilyAndRelationship.Sister1);
                        writeln('Father :', databulanan[tanggal].dataharian[j].FamilyAndRelationship.Father);
                        writeln('Mother :', databulanan[tanggal].dataharian[j].FamilyAndRelationship.Mother);
                        writeln('Brother :', databulanan[tanggal].dataharian[j].FamilyAndRelationship.Brother1);
                        writeln('Sister :',databulanan[tanggal].dataharian[j].FamilyAndRelationship.Brother2);
                        writeln('Sister :', databulanan[tanggal].dataharian[j].FamilyAndRelationship.Sister1);
                        writeln('Sister :', databulanan[tanggal].dataharian[j].FamilyAndRelationship.Sister2);
                        writeln('Relationship :', databulanan[tanggal].dataharian[j].FamilyAndRelationship.Relationship);
                        writeln('');
                        writeln('*> DETAIL AND ABOUT');
                        writeln('About :', databulanan[tanggal].dataharian[j].DetailAndAbout.About);
                        writeln('Favorite :', databulanan[tanggal].dataharian[j].DetailAndAbout.Favorite1);
                        writeln('Favorite :', databulanan[tanggal].dataharian[j].DetailAndAbout.Favorite2);
                        writeln('Favorite :', databulanan[tanggal].dataharian[j].DetailAndAbout.Favorite3);
                        writeln('');
                        x:=1;
                      end;

        readln;
        if x=0 then
                begin
                writeln('MAAF ANDA BELUM MENGINPUTKAN DATA');readln;
                end;
        writeln('TEKAN 1 jika ingin kembali ke MENU');
        readln(pilih);
        if pilih=1 then
                menu;
        end;
        Procedure ShowAll2;
        var
        i,j,x:integer;
        begin
          for i:=1 to N1  do
          begin
                writeln('DATA SEMUA TEMAN di hari ',i);
                for j:=1 to (databulanan[tanggal].N2) do
                begin
                        x:=0;
                        writeln('DATA TEMAN ke ', j);
                        writeln('*> KATEGORI CONTACT AND BASIC INFO');
                        writeln('ID:  ' , databulanan[i].dataharian[j].id);
                        writeln('Nama: ' ,databulanan[i].dataharian[j].ContactAndBasicInfo.Nama);
                        writeln('Mobile Phone: ',databulanan[i].dataharian[j].ContactAndBasicInfo.MobilePhone);
                        writeln('Address : ', databulanan[i].dataharian[j].ContactAndBasicInfo.Address);
                        writeln('Email : ', databulanan[i].dataharian[j].ContactAndBasicInfo.Email);
                        writeln('Gender : ', databulanan[i].dataharian[j].ContactAndBasicInfo.Gender);
                        writeln('Interested In: ',databulanan[i].dataharian[j].ContactAndBasicInfo.Interested);
                        writeln('Languange: ', databulanan[i].dataharian[j].ContactAndBasicInfo.Languange);
                        writeln('Religion: ', databulanan[i].dataharian[j].ContactAndBasicInfo.Religion);
                        writeln('Birthday: ', databulanan[i].dataharian[j].ContactAndBasicInfo.Birthday);
                        writeln('Umur: ', databulanan[i].dataharian[j].ContactAndBasicInfo.Umur);
                        writeln('');
                        writeln('*> KATEGORI WORK AND EDUCATION');
                        writeln('SD :', databulanan[i].dataharian[j].WorkAndEducation.SD);
                        writeln('SMP :', databulanan[i].dataharian[j].WorkAndEducation.SMP);
                        writeln('SMA :',  databulanan[i].dataharian[j].WorkAndEducation.SMA);
                        writeln('Perguruan Tinggi :',databulanan[i].dataharian[j].WorkAndEducation.PerguruanTinggi);
                        writeln('');
                        writeln('*> FAMILY AND RELATIONSHIP');
                        writeln('Work :', databulanan[i].dataharian[j].FamilyAndRelationship.Sister1);
                        writeln('Father :', databulanan[i].dataharian[j].FamilyAndRelationship.Father);
                        writeln('Mother :', databulanan[i].dataharian[j].FamilyAndRelationship.Mother);
                        writeln('Brother :', databulanan[i].dataharian[j].FamilyAndRelationship.Brother1);
                        writeln('Sister :',databulanan[i].dataharian[j].FamilyAndRelationship.Brother2);
                        writeln('Sister :', databulanan[i].dataharian[j].FamilyAndRelationship.Sister1);
                        writeln('Sister :', databulanan[i].dataharian[j].FamilyAndRelationship.Sister2);
                        writeln('Relationship :', databulanan[i].dataharian[j].FamilyAndRelationship.Relationship);
                        writeln('');
                        writeln('*> DETAIL AND ABOUT');
                        writeln('About :', databulanan[i].dataharian[j].DetailAndAbout.About);
                        writeln('Favorite :', databulanan[i].dataharian[j].DetailAndAbout.Favorite1);
                        writeln('Favorite :', databulanan[i].dataharian[j].DetailAndAbout.Favorite2);
                        writeln('Favorite :', databulanan[i].dataharian[j].DetailAndAbout.Favorite3);
                        writeln('');
                        x:=1;
                end;
                readln;
        end;

       if x=0 then
                begin
                writeln('MAAF ANDA BELUM MENGINPUTKAN DATA');readln;
                end;
        writeln('TEKAN 1 jika ingin kembali ke MENU');
        readln(pilih);
        if pilih=1 then
                menu;
        end;

BEGIN
                clrscr;
                MENU;
end.
