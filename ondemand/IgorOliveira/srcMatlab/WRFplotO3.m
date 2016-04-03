% Development : Paulo R. Teixeira
% FeedBack : paulo.ricardo.teixeira at gmail.com
%
% This computer script (M file) is distributed in the hope that it will
% be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program; if not, please download it from
% <http://www.gnu.org/licenses>
%
% Release Note:
%
% $Revision: 0.1 $
% $Date: 2016/04/03 01:05:00 $

info.path='G:\IgorCH4_matlab\IGOR_CH4\Programas\ADAM\2008.met13';
info.file='out2008met13.nc';
info.col=26:49;
info.np=3;
info.nfig=ceil(size(info.col,2)/info.np);
info.s=[0.10 0.65 0.5 0.25;...
    0.10 0.38 0.5 0.25;...
    0.10 0.11 0.5 0.25];
info.aux=0;

for ifig=1:info.nfig
    figure(ifig)
    for auxfig=1:info.np
        info.aux=info.aux+1;
        
        subplot(3,1,auxfig)
        
        h=axesm('mapprojection','miller','geoid',referenceEllipsoid('wgs84'),...
            'MapLatLimit',[-3.9329 -1.8822],...
            'MapLonLimit',[-61.6249 -59.0311],...
            'frame','on','FEdgeColor',[0.1500 0.1500 0.1500],'FFaceColor','w',...
            'angleunits','degrees','LabelUnits','degrees','MLabelRound',-2,...
            'PLabelRound',-2,'fontname','helvetica','fontweight','bold',...
            'origin',[0 0 0],'grid','on','parallellabel','on',...
            'meridianlabel','on','aspect','normal','flinewidth',1,...
            'fontsize',8,'mlinelocation',1,'plinelocation',0.5);
        tightmap;set(h,'visible','off')
        
        oz1=ncread([info.path,filesep,info.file],'o3');
        oz2=double(oz1(:,:,4,info.col(info.aux)));
        surfm(lat_w,lon_w,oz2.*1000); contourcmap('jet',0:1:60);clear oz2
    end
    
end
