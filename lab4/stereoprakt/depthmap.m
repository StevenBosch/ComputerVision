function I = depthmap(IL, IR, pw, ph, match)
% pw     width patch
% ph     height patch
% match  matching method
% shape  shape of the 

Iwidth = length(IL(1,:))-pw+1;
Iheight = length(IL(:,1))-ph+1;
I = zeros(Iheight, Iwidth);
stripLength = 15;

wbar = waitbar(0,'Constructing depth map...');
for ity = 1 : Iheight
    for  itx = 1 : Iwidth
        patchL = IL(ity:ity+ph-1, itx:itx+pw-1, :);
        
        %stripR = IR(ity:ity+ph-1, :, :);
        if itx <= stripLength
            stripR = IR(ity:ity+ph-1, 1 : itx+pw-1, :); 
        else stripR = IR(ity:ity+ph-1, itx-stripLength : itx+pw-1-5, :);
        end
        sim = match(patchL, stripR);
        % rsimilarity = match(patchL(:,:,1), stripR(:,:,1));
        % gsimilarity = match(patchL(:,:,1), stripR(:,:,2));
        % bsimilarity = match(patchL(:,:,1), stripR(:,:,3));

        [~, xR] = max(sim);
        
        %[~, xR] = max(rsimilarity + gsimilarity + bsimilarity);
        if itx <= stripLength
            I(ity,itx) = itx - xR;
        else I(ity,itx) = stripLength - xR;
        end
    end
    waitbar(ity/Iheight);
end
close(wbar);