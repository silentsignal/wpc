--- start ${sd.get_type()} security descriptor ---   
        %if sd.get_owner() is not None:
Owner:  ${sd.get_owner().get_fq_name()}
        %else:
Owner:   [none] 
        %endif
        
        %if sd.get_group() is not None:
Group:    ${sd.get_group().get_fq_name()}
        %else:
Group:   [none] 
        %endif

%for a in sd.get_aces():
    %if flag:
        %if not a.get_principal().is_trusted():
${a.as_text()}
        %else:
${a.as_text()}
        %endif
    %endif
%endfor
--- end security descriptor ---
