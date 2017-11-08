image=importdata('ucid00070.tif');
image=double(image);
image=image./255;
hsvimage=rgb2hsv(image).*255;
ii=1;
th=2;
[m,n,xx]=size(hsvimage);
    
    for k=1:3
        upperLBC=zeros(1,9);
        lowerLBC=zeros(1,9);
        
        for i=2:m-1
            for j=2:n-1
                pixelv=hsvimage(i,j,k);
                positive=0;
                negative=0;
                
                if ( hsvimage(i-1,j-1,k)-pixelv)>th
                    positive=positive +1;
                end
                if ( hsvimage(i-1,j,k)-pixelv)>th
                    positive=positive +1;
                end
                if ( hsvimage(i-1,j+1,k)-pixelv)>th
                    positive=positive +1;
                end
                if ( hsvimage(i,j-1,k)-pixelv)>th
                    positive=positive +1;
                end
                if ( hsvimage(i,j+1,k)-pixelv)>th
                    positive=positive +1;
                end
                if ( hsvimage(i+1,j-1,k)-pixelv)>th
                    positive=positive +1;
                end
                if ( hsvimage(i+1,j,k)-pixelv)>th
                    positive=positive +1;
                end
                if ( hsvimage(i+1,j+1,k)-pixelv)>th
                    positive=positive +1;
                end
                
                
                %negative
                if ( hsvimage(i-1,j-1,k)-pixelv)<-th
                    negative=negative +1;
                end
                if ( hsvimage(i-1,j,k)-pixelv)<-th
                    negative=negative +1;
                end
                if ( hsvimage(i-1,j+1,k)-pixelv)<-th
                    negative=negative +1;
                end
                if ( hsvimage(i,j-1,k)-pixelv)<-th
                    negative=negative +1;
                end
                if ( hsvimage(i,j+1,k)-pixelv)<-th
                    negative=negative +1;
                end
                if ( hsvimage(i+1,j-1,k)-pixelv)<-th
                    negative=negative +1;
                end
                if ( hsvimage(i+1,j,k)-pixelv)<-th
                    negative=negative +1;
                end
                if ( hsvimage(i+1,j+1,k)-pixelv)<-th
                    negative=negative +1;
                end
                upperLBC(positive+1)=upperLBC(positive+1)+1;
                lowerLBC(negative+1)=lowerLBC(negative+1)+1;
            end
        end
        upperLBC=upperLBC/((m-2)*(n-2));
        lowerLBC=lowerLBC/((m-2)*(n-2));
        LBC(k,:)=[upperLBC lowerLBC];
    end
    
    feature(ii,:)=[LBC(1,:) LBC(2,:) LBC(3,:)]; 
%% plot
plot(1:9,feature(1,1:9),'r+')
