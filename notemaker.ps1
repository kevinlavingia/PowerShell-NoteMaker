write-host "                          WELCOME TO NOTEMAKER" -foregroundcolor "green"
write-host "                          ====================" -foregroundcolor "green"
write-host ""
write-host "   This application allows you to create and read notes" -foregroundcolor "yellow"
write-host ""
do{
$x = 1
write-host ""
write-host "Menu" -foregroundcolor "white"
write-host ""
write-host "1) Create new note" -foregroundcolor "white"
write-host "2) List notes" -foregroundcolor "white"
write-host "3) Read notes" -foregroundcolor "white"
write-host "4) Edit notes" -foregroundcolor "white"
write-host "5) Delete notes" -foregroundcolor "white" 
write-host "6) Exit" -foregroundcolor "white"
write-host ""

$choice = read-host "Enter choice"
write-host "----------------------------------------------------------------------------" -foregroundcolor "blue"
write-host ""
if($choice -eq 1){

        write-host "CREATE NOTES" -foregroundcolor "yellow"
        write-host "============" -foregroundcolor "yellow"
        
        $note_path = get-item "notes"
        if($note_path){
        }
        else{
                $curr_path = pwd
                new-item -type "directory" -path $curr_path -name "notes"    
        }
        
        write-host ""       
        $note_title = read-host "Enter note title"
        $note_text = read-host "Enter note text"
        write-host ""  
        $result = new-item -type "file" -path "notes" -name $note_title -value $note_text
        write-host ""
        if($result){
            write-host "Note created successfully" -foregroundcolor "green"
        }
        else{
            write-host "Error occured in creating note, try again" -foregroundcolor "red"
        }    
       
}
elseif($choice -eq 2){
            
        write-host "LIST NOTES" -foregroundcolor "yellow"
        write-host "==========" -foregroundcolor "yellow"
        write-host ""
        $result = get-item "notes\*"
        write-host ""
        if($result){
                write-host "============================================================" -foregroundcolor "blue"
                get-item "notes\*"
                write-host "============================================================" -foregroundcolor "blue"
        }
        else{
            write-host "No note found" -foregroundcolor "red"
        }

}
elseif($choice -eq 3){
       
        write-host "READ NOTES" -foregroundcolor "yellow"
        write-host "==========" -foregroundcolor "yellow"
        write-host ""
        write-host "============================================================" -foregroundcolor "blue"
        get-item "notes\*"
        write-host "============================================================" -foregroundcolor "blue"
        write-host ""
        $note_name = read-host "Enter the name of the note" 
        write-host ""
        write-host "NOTE CONTENT" -foregroundcolor "white"
        write-host "============" -foregroundcolor "white"
        $comb_str = -join("notes\",$note_name)
        get-content $comb_str
       
}
elseif($choice -eq 4){
        
        write-host "EDIT NOTES" -foregroundcolor "yellow"
        write-host "==========" -foregroundcolor "yellow"
        write-host ""
        write-host "============================================================" -foregroundcolor "blue"
        get-item "notes\*"
        write-host "============================================================" -foregroundcolor "blue"
        write-host ""
        $note_name = read-host "Enter the name of the note" 
        $new_content = read-host "Enter new content" 
        write-host ""
        $comb_str = -join("notes\",$note_name)
        set-content -path $comb_str -value $new_content
        
          
             
        
}        
elseif($choice -eq 5){
         
        write-host "DELETE NOTES" -foregroundcolor "white"
        write-host "============" -foregroundcolor "white"
        write-host ""
        write-host "============================================================" -foregroundcolor "blue"
        get-item "notes\*"
        write-host "============================================================" -foregroundcolor "blue"
        write-host ""
        $note_name = read-host "Enter the name of the note" 
        write-host ""
        $comb_str = -join("notes\",$note_name)
        $result = remove-item $comb_str -confirm
         
        
}
elseif($choice -eq 6){
        exit
}    
else{
        write-host "Invalid choice, try again" -foregroundcolor "red"
}        
     
    
   }while($x -eq 1)
    
    
