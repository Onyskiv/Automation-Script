/ *      
 [ I N F O ]    
  
 N A M E   =   A u t o m a t i o n   S c r i p t  
 V E R S I O N   =   1 . 0 . 4  
 A U T H O R   =   M a s t a M a n  
 D E V   =    
 H E L P   =   h e l p \ a u t o m a t i o n S c r i p t . h t m l  
  
 [ 1 . 0 . 0 ]  
  
 *   I n i t i a l   r e l e a s e   =  
  
 [ 1 . 0 . 1 ]  
  
 +   A d d e d :   S u p p o r t   f o r   T G A   f o r m a t =  
  
 [ 1 . 0 . 2 ]  
  
 +   A d d e d :   R e n d e r   f r o m   d i f f e r e n t   c a m s =  
  
 [ 1 . 0 . 3 ]  
  
 +   A d d e d :   B u t t o n   Q u a d r i f y   U V W =  
 -   B u g F i x :   R e n d e r   o n l y   o n e   t e x t u r e =  
 *   I f   n o t   f o u n d   c a m s   f r o m   l i s t ,   g e t   d e f a u l t   c a m =  
  
 [ 1 . 0 . 4 ]  
 -   B u g F i x :   S m a l l   f i x e s =  
 *   C h a n g e d :   H a r d c o d e d   r e s o l u t i o n   f o r   o u t   r e n d e r   3 0 0 0 x 1 9 2 0 =  
  
 [ 1 . 0 . 5 ]  
 +   A d d e d :   R e p l a c e   m a t e r i a l s   f u n c t i o n a l i t y =  
 +   A d d e d :   O p t i o n   r e n d e r   t o   s e p a r a t e   f o l d e r s =  
 +   A d d e d :   O p t i o n s   r e n d e r   s i z e =  
 *   C h a n g e d :   R e m o v e d   u n u s e d   o l d   U I   e l e m e n t s =  
  
 [ A B O U T ]  
  
 T h i s   s c r i p t   a u t o m a t e   r e n d e r i n g =  
  
 [ S C R I P T ]  
 * / 	  
  
 t r y ( c l o s e R o l l o u t F l o a t e r   f A u t o m a t i o n S c r i p t )   c a t c h ( )  
 g l o b a l   f A u t o m a t i o n S c r i p t   =   n e w R o l l o u t F l o a t e r   " A u t o m a t i o n   S c r i p t "   3 0 0   8 8 0  
  
 f n   g e t S c r i p t I n f o   s   r e l e a s e I n f o :   " "   =  
 ( 	 	  
 	 i f ( r e l e a s e I n f o   ! =   " " )   d o  
 	 (  
 	 	 r   =   g e t I N I S e t t i n g   s   r e l e a s e I n f o  
 	 	 r e t u r n   r  
 	 )  
 	  
 	 v   =   g e t I N I S e t t i n g   s   " I N F O "   " V E R S I O N "  
 	 a   =   g e t I N I S e t t i n g   s   " I N F O "   " A U T H O R "  
 	 n   =   g e t I N I S e t t i n g   s   " I N F O "   " N A M E "  
 	 o   =   g e t I N I S e t t i n g   s   " A B O U T "  
 	 c   =   g e t I N I S e t t i n g   s   " I N F O "   " D E V "  
 	 h   =   g e t I N I S e t t i n g   s   " I N F O "   " H E L P "  
 	  
 	 r   =   f o r   i   i n   ( g e t I N I S e t t i n g   s )   w h e r e   i   ! =   " A B O U T "   a n d   i   ! =   " S C R I P T "   a n d   i   ! =   " C O P Y "   c o l l e c t   i  
 	  
 	 r e t u r n   # ( n ,   a ,   v ,   o ,   r ,   c ,   h )  
 )  
  
 r o l l o u t   _ r S t e p 0     " M a i n "  
 (  
 	 f n   p i c k M a t e r i a l F i l t e r   o b j   =   o b j . m a t e r i a l   ! =   u n d e f i n e d    
 	  
 	 g r o u p   " S c e n e s "  
 	 (  
 	 	 l i s t b o x   l b x M o d e l s L i s t   " "   h e i g h t :   1 0  
 	 	 b u t t o n   b t n A d d M o d e l s   " A d d "   w i d t h :   9 0   a c r o s s :   2  
 	 	 b u t t o n   b t n R e m o v e M o d e l   " R e m o v e "   w i d t h :   9 0  
 	 )  
 	  
 	 g r o u p   " M a t e r i a l s "   (  
 	 	 l a b e l   l b l 1   " T h i s   m a t e r i a l   w i l l   b e   a p p l i e d   t o   t h e   o b j e c t   w i t h \ n m a t e r i a l   n a m e d   \ " r e p l a c e - m a t e r i a l \ " "   a l i g n :   # l e f t     h e i g h t :   3 0  
 	 	 l i s t b o x   l b x M a t e r i a l s L i s t   h e i g h t :   7  
 	 	 p i c k b u t t o n   b t n P i c k M a t e r i a l   " P i c k "   w i d t h :   9 0   a c r o s s :   2   f i l t e r :   p i c k M a t e r i a l F i l t e r  
 	 	 b u t t o n   b t n R e m o v e M a t e r i a l   " R e m o v e "   w i d t h :   9 0  
 	 	 p r o g r e s s b a r   h r   " "   h e i g h t :   2  
 	 	 l a b e l   l b l 2   " F o r   t h i s   m a t e r i a l ,   a l l   t e x t u r e s   w i t h \ n n a m e   \ " r e p l a c e - t e x t u r e . j p g \ "   w i l l   b e   r e p l a c e d \ n w i t h   t e x t u r e s   f r o m   t h e   f o l d e r   b e l o w "   a l i g n :   # l e f t     h e i g h t :   4 0 	 	  
 	 	 e d i t t e x t   e d t R e p l a c e T e x t u r e P a t h   " "   r e a d o n l y :   t r u e   h e i g h t :   2 2  
 	 	 b u t t o n   b t n S e l e c t M a t T e x F o l d e r P a t h   " S e l e c t   P a t h "  
 	 )  
 	  
 	 g r o u p   " G l o b a l   S e t t i n g s "   (  
 	 	 c h e c k b o x   c b x Q u a d r i f y U V W   " Q u a d r i f y   U V W "   a l i g n :   # l e f t  
 	         c h e c k b o x   c b x U s e S e p a r a t e F o l d e r s   " U s e   s e p a r a t e   f o l d e r s "   c h e c k e d :   t r u e  
 	 	 l a b e l   l b l R e n d S i z e   " R e n d e r   S i z e :   "   a c r o s s :   4   a l i g n :   # l e f t  
 	 	 s p i n n e r   s p n R e n d W i d t h   r a n g e :   [ 1 5 0 ,   1 6 0 0 0 ,   3 0 0 0 ]   t y p e :   # i n t e g e r   f i e l d w i d t h :   5 0   a l i g n :   # l e f t  
 	 	 l a b e l   l b l X   " x "   a l i g n :   # l e f t    
 	 	 s p i n n e r   s p n R e n d H e i g h t   r a n g e :   [ 9 6 ,   1 6 0 0 0 ,   1 9 2 0 ]   t y p e :   # i n t e g e r   f i e l d w i d t h :   5 0   a l i g n :   # l e f t   o f f s e t :   [ - 5 7 ,   0 ]  
 	 )  
 	  
 	 g r o u p   " C a m e r a s "  
 	 (  
 	 	 l a b e l   l b l C a m e r a s   " A d d   p a r t   o f   c a m e r a   n a m e   s e p a r a t e d   b y   \ " , \ " "   a l i g n :   # l e f t  
 	 	 l a b e l   l b l C a m e r a s 2   " E x a m p l e :   f r o n t ,   l e f t ,   t o p "   a l i g n :   # l e f t 	 	  
 	 	 e d i t t e x t   e d t C a m e r a s   " "   h e i g h t : 2 5    
 	 )  
 	  
 	 g r o u p   " S a v e   r e n d e r s   t o "  
 	 (  
 	 	 e d i t t e x t   e d t S a v e R e n d e r s T o   " "   h e i g h t : 2 5   r e a d O n l y : t r u e    
 	 	 b u t t o n   b t n S a v e R e n d e r s T o   " B r o w s e " 	 	  
 	 )  
 	  
 	 b u t t o n   b t n S t a r t R e n d e r   " S t a r t   R e n d e r "   w i d t h :   2 7 9   h e i g h t :   4 0   o f f s e t :   [ 0 ,   1 0 ]  
  
 	 g l o b a l   i n i V a u l t   =   " "  
 	 g l o b a l   i n i L o g A S   =   " "  
 	  
 	 f n   g e t O p e n M o d e l s   =    
 	 (  
 	 	 f   =   # ( )  
 	 	  
 	 	 m o d e l s D i a l o g   =   d o t N e t O b j e c t   " S y s t e m . W i n d o w s . F o r m s . O p e n F i l e D i a l o g "    
 	 	 m o d e l s D i a l o g . t i t l e   =   " S e l e c t   M o d e l s "  
 	 	 m o d e l s D i a l o g . M u l t i s e l e c t   =   t r u e  
 	 	 m o d e l s D i a l o g . F i l t e r   =   " 3 D   S t u d i o   M a x   ( * . m a x ) | * . m a x "  
 	 	 m o d e l s D i a l o g . F i l t e r I n d e x   =   1  
 	 	  
 	 	 r e s u l t   =   m o d e l s D i a l o g . s h o w D i a l o g ( )    
 	 	 r e s u l t . T o S t r i n g ( )    
 	 	 r e s u l t . E q u a l s   r e s u l t . O K    
 	 	 r e s u l t . E q u a l s   r e s u l t . C a n c e l    
 	 	  
 	 	 f   =   m o d e l s D i a l o g . f i l e N a m e s    
 	 	    
 	 	 r e t u r n   f  
 	 )  
 	  
 	 f n   g e t Q u a d r i f y U V W   =   g e t I n i S e t t i n g   i n i V a u l t   " T E X T U R E S "   " Q U A D R I F Y U V W "  
 	 f n   s e t Q u a d r i f y U V W   p   =   s e t I n i S e t t i n g   i n i V a u l t   " T E X T U R E S "   " Q U A D R I F Y U V W "   ( p   a s   s t r i n g )  
 	  
 	 f n   g e t M o d e l s   =   g e t I n i S e t t i n g   i n i V a u l t   " M O D E L S "  
 	 f n   a d d M o d e l s   m   =   f o r   i   i n   m   d o   s e t I n i S e t t i n g   i n i V a u l t   " M O D E L S "   i   " "  
 	 	  
 	 f n   g e t S a v e R e n d e r s T o   =   g e t I n i S e t t i n g   i n i V a u l t   " R E N D E R "   " S A V E T O "  
 	 f n   s e t S a v e R e n d e r s T o   p   =   s e t I n i S e t t i n g   i n i V a u l t   " R E N D E R "   " S A V E T O "   p  
 	 	  
 	 f n   s e t C a m e r a s   p   =   s e t I n i S e t t i n g   i n i V a u l t   " C A M E R A S "   " E N U M "   p  
 	 f n   g e t C a m e r a s A r r a y   =   f o r   i   i n   ( f i l t e r S t r i n g   ( g e t I n i S e t t i n g   i n i V a u l t   " C A M E R A S "   " E N U M " )   " , " )   c o l l e c t   t r i m R i g h t   ( t r i m L e f t   i   "   " )   "   "  
 	 f n   g e t C a m e r a s   =   g e t I n i S e t t i n g   i n i V a u l t   " C A M E R A S "   " E N U M "  
 	 f n   g e t C a m L i s t   =   (  
 	 	 c a m s   =   # ( )  
 	 	 c a m s A r r a y   =   g e t C a m e r a s A r r a y ( )  
 	 	 f o r   c c   i n   ( c a m e r a s   a s   a r r a y )   w h e r e   c l a s s O f   c c   ! =   T a r g e t o b j e c t   d o   f o r   c   i n   c a m s A r r a y   w h e r e   f i n d S t r i n g   c c . n a m e   c   = =   1   d o   a p p e n d   c a m s   c c  
 	 	  
 	 	 i f ( c a m s . c o u n t   = =   0   a n d   c a m e r a s . c o u n t   ! =   0 )   d o   a p p e n d   c a m s   c a m e r a s [ 1 ]  
 	 	  
 	 	 r e t u r n   c a m s  
 	 )  
 	  
 	 f n   g e t R e n d e r S i z e   =   (  
 	 	 w   =   g e t I n i S e t t i n g   i n i V a u l t   " R E N D E R "   " W "  
 	 	 h   =   g e t I n i S e t t i n g   i n i V a u l t   " R E N D E R "   " H "  
 	 	  
 	 	 t r y ( i f ( w . c o u n t   >   1 )   d o   s p n R e n d W i d t h . v a l u e   =   w   a s   i n t e g e r )   c a t c h ( )  
 	 	 t r y ( i f ( h . c o u n t   >   1 )   d o   s p n R e n d H e i g h t . v a l u e   =   h   a s   i n t e g e r )   c a t c h ( )  
 	 )  
 	  
 	 f n   g e t M a t L i s t K e y   s h o w E r r o r :   f a l s e   =   (  
 	 	 s e l   =   l b x M a t e r i a l s L i s t . s e l e c t e d  
 	 	 i d   =   l b x M a t e r i a l s L i s t . s e l e c t i o n  
 	 	  
 	 	 i f ( i d   = =   0 )   d o   (  
 	 	 	 i f ( s h o w E r r o r )   d o   m e s s a g e B o x   " P l e a s e   s e l e c t   M a t e r i a l   f r o m   l i s t ! "   t i t l e :   " W a r n i n g ! " 	  
 	 	 	 r e t u r n   u n d e f i n e d  
 	 	 )  
 	 	  
 	 	 r e t u r n   s u b s t i t u t e S t r i n g   s e l   " [ E m p t y   P a t h ]   "   " "  
 	 )  
 	  
 	 f n   g e t M a t e r i a l s S e t u p   =   g e t I n i S e t t i n g   i n i V a u l t   " M A T E R I A L S "  
 	  
 	 f n   i m p l o d e   a   t a g :   " ,   "   =   (  
 	 	 r e t   =   " "  
 	 	 f o r   i   i n   1   t o   a . c o u n t   d o   r e t   + =   a [ i ]   +   ( i f ( i   = =   a . c o u n t )   t h e n   " "   e l s e   t a g )  
 	 	 r e t u r n   r e t  
 	 )  
 	 	  
 	 f n   g e t M a t e r i a l s A n d P a t h s   s h o w E r r o r :   f a l s e   =   (  
 	 	 m m   =   g e t M a t e r i a l s S e t u p ( )  
 	 	  
 	 	 o   =   o b j e c t s   a s   a r r a y  
 	 	 r e s   =   # ( )  
 	 	  
 	 	 f o r   i   i n   m m   d o   (  
 	 	 	 f o r   i i   i n   o   w h e r e   i i . m a t e r i a l   ! =   u n d e f i n e d   a n d   ( m a t c h P a t t e r n   i i . m a t e r i a l . n a m e   p a t t e r n :   ( i   +   " * " ) )   d o   (  
 	 	 	 	 p   =   g e t I n i S e t t i n g   i n i V a u l t   " M A T E R I A L S "   i  
 	 	 	 	 - -   m a t e r i a l ,   n a m e ,   o b j e c t ,   p a t h  
 	 	 	 	 a p p e n d I f U n i q u e   r e s   # ( i i . m a t e r i a l ,   i ,   i i ,   p )  
 	 	 	 	 e x i t  
 	 	 	 )  
 	 	 )  
 	 	 m s g   =   " "  
  
 	 	 i f ( m m . c o u n t   ! =   r e s . c o u n t )   d o   (  
 	 	 	 f o u n d N a m e s   =   f o r   i   i n   r e s   c o l l e c t   i [ 2 ]  
 	 	 	 n o t F o u n d N a m e s   =   f o r   i   i n   m m   w h e r e   ( a p p e n d I f U n i q u e   f o u n d N a m e s   i )   c o l l e c t   i  
 	 	 	 i f ( n o t F o u n d N a m e s . c o u n t   >   0 )   d o   (  
 	 	 	 	 m s g   =   " N e x t   m a t e r i a l s   n o t   f o u n d :   "  
 	 	 	 	 m s g   + =   i m p l o d e   n o t F o u n d N a m e s  
 	 	 	 	 m s g   + =   " ! "  
 	 	 	 	  
 	 	 	 	 r e t u r n   # ( u n d e f i n e d ,   m s g )  
 	 	 	 )  
 	 	 )  
 	 	  
 	 	 n o t F o u n d P a t h s   =   f o r   i   i n   r e s   w h e r e   ( n o t   d o e s F i l e E x i s t   i [ 4 ] )   o r   i [ 4 ]   = =   " "   c o l l e c t   i [ 2 ]  
 	 	 i f ( n o t F o u n d P a t h s . c o u n t   >   0 )   d o   (  
 	 	 	 m s g   =   " P l e a s e   c h o o s e   T e x t u r e s   p a t h   f o r   n e x t   m a t e r i a l s :   "  
 	 	 	 m s g   + =   i m p l o d e   n o t F o u n d P a t h s  
 	 	 	 m s g   + =   " ! "  
 	 	 	  
 	 	 	 r e t u r n   # ( u n d e f i n e d ,   m s g )  
 	 	 )  
 	 	  
 	 	 r e t u r n   # ( r e s ,   m s g )  
 	 )  
 	  
 	 f n   u p d a t e M a t L i s t   =   (  
 	 	 m m   =   g e t M a t e r i a l s S e t u p ( )  
 	  
 	 	 r e s   =   # ( )  
 	 	 f o r   i   i n   m m   d o   (  
 	 	 	 v   =   g e t I n i S e t t i n g   i n i V a u l t   " M A T E R I A L S "   i  
 	 	 	 i f ( v   = =   " "   o r   n o t   d o e s F i l e E x i s t   v )   t h e n   (  
 	 	 	 	 p r i n t   v  
 	 	 	 	 a p p e n d   r e s   ( " [ E m p t y   P a t h ]   "   +   i )  
 	 	 	 )   e l s e   (  
 	 	 	 	 a p p e n d   r e s   i  
 	 	 	 )  
 	 	 )  
 	 	  
 	 	 l b x M a t e r i a l s L i s t . i t e m s   =   r e s  
 	 	 n   =   g e t M a t L i s t K e y   s h o w E r r o r :   f a l s e  
 	 	 i f ( n   ! =   u n d e f i n e d )   d o   (  
 	 	 	 p   =   g e t I n i S e t t i n g   i n i V a u l t   " M A T E R I A L S "   n  
 	 	 	 e d t R e p l a c e T e x t u r e P a t h . t e x t   =   p  
 	 	 )  
 	 )  
  
 	 o n   b t n P i c k M a t e r i a l   p i c k e d   o b j   d o   (  
 	 	 i f ( o b j   = =   u n d e f i n e d )   d o   r e t u r n   f a l s e  
                  
                 n   =   o b j . m a t e r i a l . n a m e  
 	 	  
 	 	 m m   =   g e t I n i S e t t i n g   i n i V a u l t   " M A T E R I A L S "   n  
 	 	 i f ( m m   ! =   " " )   d o   r e t u r n   u p d a t e M a t L i s t ( )  
 	 	  
 	 	 s e t I n i S e t t i n g   i n i V a u l t   " M A T E R I A L S "   n   " "  
 	 	  
 	 	 u p d a t e M a t L i s t ( )  
 	 )  
 	  
 	 o n   b t n R e m o v e M a t e r i a l   p r e s s e d   d o   (  
 	 	 n   =   g e t M a t L i s t K e y   s h o w E r r o r :   t r u e  
 	 	 i f ( n   = =   u n d e f i n e d )   d o   r e t u r n   f a l s e  
 	 	  
 	 	 - - q   =   q u e r y B o x   ( " D o   y o u   r e a l l y   w a n t   t o   d e l e t e   M a t e r i a l   \ " "   +   n   +   " \ "   f r o m   l i s t ? " )   t i t l e :   " C o n f i r m ? "  
 	 	 - - i f ( n o t   q )   d o   r e t u r n   f a l s e  
 	 	  
 	 	 d e l I n i S e t t i n g   i n i V a u l t   " M A T E R I A L S "   n  
 	 	 e d t R e p l a c e T e x t u r e P a t h . t e x t   =   " "  
 	 	  
 	 	 u p d a t e M a t L i s t ( )  
 	 )  
 	  
 	 o n   b t n S e l e c t M a t T e x F o l d e r P a t h   p r e s s e d   d o   (  
 	 	 n   =   g e t M a t L i s t K e y   s h o w E r r o r :   t r u e  
 	 	 i f ( n   = =   u n d e f i n e d )   d o   r e t u r n   f a l s e  
 	 	  
 	 	 f   =   g e t S a v e F i l e N a m e   f i l e n a m e :   " D O   N O T   C H A N G E   N A M E "   c a p t i o n : " S a v e   F i l e "   t y p e s : " J P E G   ( * . j p g ) | * . j p g "  
                 i f ( f   = =   u n d e f i n e d )   d o   r e t u r n   f a l s e  
  
                 p   =   g e t F i l e N a m e P a t h   f  
 	 	  
 	 	 s e t I n i S e t t i n g   i n i V a u l t   " M A T E R I A L S "   n   p  
 	 	    
 	 	 u p d a t e M a t L i s t ( )      
 	 )  
 	  
 	 o n   l b x M a t e r i a l s L i s t   s e l e c t e d   v   d o   (  
 	 	 u p d a t e M a t L i s t ( )      
 	 )  
 	  
 	 f n   g e t T e x t u r e s   p   i g n o r e :   " r e p l a c e - t e x t u r e "   =   (  
 	 	 t e x   =   # ( )  
 	 	  
 	 	 t y p e s   =   # ( " . j p g " ,   " . p n g " ,   " . t i f f " ,   " . g i f " ,   " . b m p " ,   " . t g a " )  
 	 	 f o r   i   i n   t y p e s   d o   j o i n   t e x   ( g e t F i l e s   ( p   +   @ " \ * "   +   i ) )  
 	 	  
 	 	 o u t   =   f o r   i   i n   t e x   w h e r e   ( g e t F i l e n a m e F i l e   i )   ! =   i g n o r e   c o l l e c t   i  
 	 	 	  
 	 	 r e t u r n   o u t  
 	 )  
 	  
 	 f n   g e t O b j e c t s     =   (  
 	 	 o   =   # ( )  
 	 	 f o r   i   i n   ( o b j e c t s   a s   a r r a y )   d o   (  
 	 	 	 a p p e n d   o   i  
 	 	 )  
 	 	  
 	 	 r e t u r n   o  
 	 )  
 	  
 	 f n   g e t B i t m a p s T o R e p l a c e   m   n :   " r e p l a c e - t e x t u r e "   =   (  
 	 	 o   =   # ( )  
 	 	 f o r   b   i n   g e t C l a s s I n s t a n c e s   B i t m a p t e x t u r e     t a r g e t : m   d o   (  
 	 	 	 i f ( b . f i l e n a m e   = =   u n d e f i n e d )   d o   c o n t i n u e  
 	 	 	 f   =   g e t F i l e n a m e F i l e     b . f i l e n a m e 	 	 	  
 	 	 	 i f ( f   = =   n )   d o   a p p e n d   o   b  
 	 	 )  
 	 	 r e t u r n   o  
 	 )  
 	  
 	 f n   g e t R e p l a c e M a t e r i a l   =   ( 	  
 	 	 f o r   i   i n   S c e n e M a t e r i a l s   w h e r e   ( m a t c h P a t t e r n   i . n a m e   p a t t e r n :   " r e p l a c e - m a t e r i a l * " )   d o   r e t u r n   i  
 	 	 r e t u r n   u n d e f i n e d  
 	 )  
  
 	 f n   g e t O b j e c t s W i t h R e p l a c e M a t e r i a l   =   (  
 	 	 r e s   =   # ( )  
 	 	 m   =   g e t R e p l a c e M a t e r i a l ( )  
 	 	 i f ( m   = =   u n d e f i n e d )   d o   r e t u r n   # ( )  
 	 	 f o r   i i   i n   r e f s . d e p e n d e n t s   m   w h e r e   s u p e r C l a s s O f   i i   = =   G e o m e t r y C l a s s   d o   a p p e n d I f U n i q u e   r e s   i i 	 	  
 	 	 r e t u r n   r e s  
 	 )  
 	  
 	 f n   g e t L o w P o l y P a i r   a   =   (  
 	 	 r e s   =   # ( )  
 	 	 n a m e s   =   f o r   i   i n   a   c o l l e c t   t r i m R i g h t   ( t r i m R i g h t   i . n a m e   " 0 1 2 3 4 5 6 7 8 9 " )   " _ h i g h "  
 	 	 	  
 	 	 o   =   o b j e c t s   a s   a r r a y  
 	 	 f o r   i   i n   o   d o   (  
 	 	 	 f o r   i i   i n   n a m e s   w h e r e   ( m a t c h P a t t e r n   i . n a m e   p a t t e r n :   ( i i   +   " _ l o w * " ) )   d o   (  
 	 	 	 	 a p p e n d   r e s   i  
 	 	 	 	 e x i t  
 	 	 	 )  
 	 	 )  
 	 	  
 	 	 r e t u r n   r e s  
 	 )  
 	  
 	 o n   b t n S e l e c t M a t T e x F o l d e r P a t h   p r e s s e d   d o   (  
 	 	 n   =   g e t M a t L i s t K e y   s h o w E r r o r :   t r u e  
 	 	 i f ( n   = =   u n d e f i n e d )   d o   r e t u r n   f a l s e  
 	 	  
 	 	 f   =   g e t S a v e F i l e N a m e   f i l e n a m e :   " D O   N O T   C H A N G E   N A M E "   c a p t i o n : " S a v e   F i l e "   t y p e s : " J P E G   ( * . j p g ) | * . j p g "  
                 i f ( f   = =   u n d e f i n e d )   d o   r e t u r n   f a l s e  
  
                 p   =   g e t F i l e N a m e P a t h   f  
 	 	  
 	 	 s e t I n i S e t t i n g   i n i V a u l t   " M A T E R I A L S "   n   p  
 	 	    
 	 	 u p d a t e M a t L i s t ( )      
 	 )  
 	  
 	  
 	 f n   s e t B i t m a p T i l i g   b   =  
 	 (  
 	 	 d   =   # ( )  
  
 	 	 b . c o o r d s . U _ T i l i n g   =   1 . 0  
 	 	 b . c o o r d s . V _ T i l i n g   =   1 . 0  
  
 	 	 d [ 1 ]   =   b . b i t m a p . w i d t h   a s   f l o a t    
 	 	 d [ 2 ]   =   b . b i t m a p . h e i g h t   a s   f l o a t  
  
 	 	 k   =   1 . 0   /   ( a m a x   d   /   a m i n   d )  
  
 	 	 i f ( d [ 1 ]   >   d [ 2 ] )   t h e n   b . c o o r d s . U _ T i l i n g   =   k   e l s e   b . c o o r d s . V _ T i l i n g   =   k  
 	 )  
 	  
 	 f n   u p d a t e L i s t   =  
 	 (  
 	 	 m   =   g e t M o d e l s ( )  
 	 	  
 	 	 l b x M o d e l s L i s t . i t e m s   =   f o r   i   i n   m   c o l l e c t   g e t F i l e n a m e F i l e   i  
 	 )  
 	  
 	 f n   f i n d R e p l a c e T e x t u r e s   =    
 	 ( 	 	  
 	 	 f   =   g e t R e p l a c e T e x t u r e P a t h ( )  
 	 	 f   =   f i l e n a m e F r o m P a t h   f    
 	 	  
 	 	 r e t u r n   f o r   b   i n   g e t C l a s s I n s t a n c e s   b i t m a p t e x t u r e   w h e r e   f   ! =   " "   a n d     ( f i l e n a m e F r o m P a t h   b . f i l e n a m e   = =   f )   c o l l e c t   b 	 	  
 	 )  
 	  
 	 f n   g e t S e p a r a t e F o l d e r   =   (  
 	 	 v   =   g e t I n i S e t t i n g   i n i V a u l t   " R E N D E R "   " U S E _ S E P A R A T E _ F O L D E R S "  
                 i f ( v   = =   " 1 " )   t h e n   (  
                         c b x U s e S e p a r a t e F o l d e r s . c h e c k e d   =   t r u e  
                 )   e l s e   i f   ( v   = =   " 0 " )   t h e n   (  
 	 	 	 c b x U s e S e p a r a t e F o l d e r s . c h e c k e d   =   f a l s e  
 	 	 )  
 	 )  
 	  
 	 o n   c b x U s e S e p a r a t e F o l d e r s   c h a n g e d   v   d o   (  
                 s e t I n i S e t t i n g   i n i V a u l t   " R E N D E R "   " U S E _ S E P A R A T E _ F O L D E R S "     ( i f ( v )   t h e n   " 1 "   e l s e   " 0 " )  
         )  
 	  
 	 o n   s p n R e n d W i d t h   c h a n g e d   v   d o   (  
 	 	 s e t I n i S e t t i n g   i n i V a u l t   " R E N D E R "   " W "     ( v   a s   s t r i n g )  
 	 )  
 	  
 	 o n   s p n R e n d H e i g h t   c h a n g e d   v   d o   (  
 	 	 s e t I n i S e t t i n g   i n i V a u l t   " R E N D E R "   " H "     ( v   a s   s t r i n g )  
 	 )  
 	  
 	 o n   _ r S t e p 0   o p e n   d o  
 	 (  
 	 	 i n i V a u l t   =   g e t T h i s S c r i p t F i l e n a m e ( )   +   " . i n i "  
 	 	 i n i L o g A S   =   e d t S a v e R e n d e r s T o . t e x t   +   " l o g . i n i "  
 	 	  
 	 	 u p d a t e L i s t ( )  
 	 	 u p d a t e M a t L i s t ( )  
 	 	 g e t S e p a r a t e F o l d e r ( )  
 	 	 g e t R e n d e r S i z e ( )  
 	 	 	  
 	 	 e d t S a v e R e n d e r s T o . t e x t   =   g e t S a v e R e n d e r s T o ( )  
 	 	 	  
 	 	 c   =   g e t C a m e r a s ( )  
 	 	 e d t C a m e r a s . t e x t   =   c  
 	 	 	  
 	 	 q   =   g e t Q u a d r i f y U V W ( )  
 	 	 c b x Q u a d r i f y U V W . c h e c k e d   =   i f ( q   = =   " "   o r   q   = =   " f a l s e " )   t h e n   f a l s e   e l s e   t r u e  
 	 )  
 	  
 	 o n   e d t C a m e r a s   c h a n g e d   v   d o   s e t C a m e r a s   v  
 	 o n   c b x Q u a d r i f y U V W   c h a n g e d   v   d o   s e t Q u a d r i f y U V W   v  
 	 	  
 	 o n   b t n A d d M o d e l s   p r e s s e d   d o  
 	 (  
 	 	 f   =   g e t O p e n M o d e l s ( )  
 	 	 	 	  
 	 	 i f ( f   = =   u n d e f i n e d )   d o   r e t u r n   f a l s e  
 	 	 	 	  
 	 	 a d d M o d e l s   f  
 	 	 	 	  
 	 	 u p d a t e L i s t ( )  
 	 )  
 	  
 	 o n   b t n R e m o v e M o d e l   p r e s s e d   d o  
 	 (  
 	 	 i d   =   l b x M o d e l s L i s t . s e l e c t i o n  
 	 	  
 	 	 i f ( i d   = =   0 )   d o   r e t u r n   f a l s e  
 	 	  
 	 	 m   =   g e t M o d e l s ( )  
 	 	  
 	 	 d e l I n i S e t t i n g   i n i V a u l t   " M O D E L S "   m [ i d ]  
 	 	 	 	  
 	 	 u p d a t e L i s t ( )  
 	 )  
 	  
 	 o n   b t n S a v e R e n d e r s T o   p r e s s e d   d o  
 	 (  
 	 	 t   =   g e t S a v e R e n d e r s T o ( )  
 	 	  
 	 	 f   =   g e t S a v e P a t h   c a p t i o n :   " R e n d e r s "   i n i t i a l D i r :   t  
 	 	  
 	 	 i f ( f   = =   u n d e f i n e d )   d o   r e t u r n   f a l s e  
 	 	 	 	  
 	 	 s e t S a v e R e n d e r s T o   ( f   +   @ " \ " )  
 	 	  
 	 	 e d t S a v e R e n d e r s T o . t e x t   =   ( f   +   @ " \ " )  
 	 )  
 	  
 	 f n   i s V r a y   =   (  
 	 	 r   =   r e n d e r e r s . c u r r e n t   a s   s t r i n g  
 	 	 i f   m a t c h p a t t e r n   r   p a t t e r n : " * V _ R a y * "   d o   r e t u r n   t r u e  
 	 	 r e t u r n   f a l s e  
 	 )  
 	  
 	 f n   l o g g i n g   m   n n :   u n d e f i n e d   =   (  
 	 	 t   =   ( l o c a l T i m e   a s   s t r i n g )   +   "   ( "   +   ( t i m e S t a m p ( )   a s   s t r i n g )   +   " ) "  
 	 	 p r i n t   m  
 	 	 f   =   i n i L o g A S  
 	 	 i f ( n n   ! =   u n d e f i n e d )   d o   (  
 	 	 	 f   =   ( g e t F i l e N a m e P a t h   f )   +   n n   +   " . i n i "  
 	 	 )  
 	 	 s e t I n i S e t t i n g   f   " L O G "   t   ( "   >   "   +   m )  
 	 )  
 	  
 	 o n   b t n S t a r t R e n d e r   p r e s s e d   d o  
 	 (  
 	 	 _ R E N D E R   =   t r u e  
 	 	 l o c a l   l o g F i l e N a m e   =   s u b s t i t u t e S t r i n g   ( s u b s t i t u t e S t r i n g   ( t r i m R i g h t   l o c a l T i m e   "   A P M " )   " / "   " - " )   " : "   " . "  
 	 	  
 	 	 s z M o d e l s   =   g e t M o d e l s ( )  
 	 	 s z S a v e T o   =   g e t S a v e R e n d e r s T o ( )  
 	 	  
 	 	 i f ( s z M o d e l s . c o u n t   = =   0 )   d o   r e t u r n   m e s s a g e B o x   " P l e a s e   a d d   m o d e l s   t o   l i s t ! "   t i t l e :   " W a r n i n g ! "  
 	 	 i f ( s z S a v e T o . c o u n t   = =   0 )   d o   r e t u r n   m e s s a g e B o x   " P l e a s e   s e l e c t   o u t p u t   r e n d e r s   p a t h ! "   t i t l e :   " W a r n i n g ! "  
 	 	  
 	 	 l o c a l   v r   =   r e n d e r e r s . c u r r e n t  
 	 	 	  
 	 	 c l e a r L i s t e n e r ( )  
 	 	  
 	 	 f o r   s   i n   s z M o d e l s   w h e r e   d o e s F i l e E x i s t   s   d o  
 	 	 (  
 	 	 	 l o a d M a x F i l e   s   u s e F i l e U n i t s :   t r u e   q u i e t :   t r u e  
 	 	 	  
 	 	 	 l o g g i n g   ( " I n f o   - - >   O p e n   s c e n e :   "   +     ( f i l e n a m e F r o m P a t h   s ) )   n a m e :   l o g F i l e N a m e  
 	 	 	 	 	 	  
 	 	 	 i f ( n o t   i s V r a y ( ) )   d o   (  
 	 	 	 	 l o g g i n g   ( " E r r o r   - - >   N o t   a s s i g n e d   r e n d e r   V - R a y   f o r   s c e n e :   "   +     ( f i l e n a m e F r o m P a t h   s ) )   n a m e :   l o g F i l e N a m e  
 	 	 	 	 c o n t i n u e  
 	 	 	 )  
 	 	 	  
 	 	 	 v r   =   r e n d e r e r s . c u r r e n t  
 	 	 	 s e t V R a y S i l e n t M o d e ( )  
 	 	 	 f i l e O u t G a m m a   =   2 . 2  
 	 	 	 r e n d S a v e F i l e   =   o n  
 	 	 	 r e n d e r W i d t h   =   s p n R e n d W i d t h . v a l u e  
 	 	 	 r e n d e r H e i g h t   =   s p n R e n d H e i g h t . v a l u e  
 	 	 	 v f b C o n t r o l   # s h o w   t r u e 	 	 	 	  
 	 	 	 - -   C l e a r   P r e v i o u s   f r a m e  
 	 	 	 v r . s y s t e m _ p r e v i o u s R e n d e r   =   5  
 	 	 	 - -   S e t   R e n d e r   M a s k   f o r   n o n e  
 	 	 	 v r . i m a g e S a m p l e r _ r e n d e r M a s k _ t y p e   =   0  
 	 	 	  
 	 	 	 - -   V r a y   O u t p u t   S e t t i n g s  
 	 	 	 v r . o u t p u t _ o n   =   t r u e  
 	 	 	 v r . o u t p u t _ u s e r a m   =   t r u e  
 	 	 	 v r . o u t p u t _ s a v e R a w F i l e   =   f a l s e  
 	 	 	 v r . o u t p u t _ s p l i t g b u f f e r   =   t r u e  
 	 	 	 v r . o u t p u t _ s p l i t R G B   =   t r u e  
 	 	 	 v r . o u t p u t _ s p l i t A l p h a   =   t r u e  
 	 	 	 v r . o u t p u t _ g e n p r e v i e w   =   t r u e  
 	 	 	  
 	 	 	 - -   S e t   a u t o   q u a l i t y   f o r   j p e g  
 	 	 	 - - J P E G . i j p e g i o . s e t Q u a l i t y   1 0 0  
 	 	 	 t i f . i t i f i o . s e t A l p h a   # t r u e  
 	 	 	 t i f . i t i f i o . s e t T y p e   # c o l o r  
 	 	 	 t i f . i t i f i o . s e t C o m p r e s s i o n   # n o n e  
 	 	 	  
 	 	 	 c a m s   =   g e t C a m L i s t ( )  
 	 	 	  
 	 	 	 l a s t R e p l a c e M a t e r i a l   =   u n d e f i n e d  
 	 	 	 l a s t R e p l a c e M a t e r i a l   =   g e t R e p l a c e M a t e r i a l ( )  
 	 	 	 i f ( l a s t R e p l a c e M a t e r i a l   = =   u n d e f i n e d )   d o   (  
 	 	 	 	 l o g g i n g   ( " E r r o r   - - >   N o t   f o u n d   \ " r e p l a c e - m a t e r i a l \ "   i n   s c e n e :   "   +     ( f i l e n a m e F r o m P a t h   s ) )   n a m e :   l o g F i l e N a m e  
 	 	 	 	 c o n t i n u e  
 	 	 	 )  
 	 	 	  
 	 	 	 m o d e l s   =   g e t O b j e c t s W i t h R e p l a c e M a t e r i a l ( )  
 	 	 	 e x i s t M o d e l s   =   m o d e l s  
 	 	 	 n o t U s e d M o d e l s   =   f o r   i   i n   g e t O b j e c t s ( )   w h e r e   ( a p p e n d I f U n i q u e   e x i s t M o d e l s   i )   c o l l e c t   i  
 	 	 	  
 	 	 	 i f ( m o d e l s . c o u n t   = =   0 )   d o   (  
 	 	 	 	 l o g g i n g   ( " E r r o r   - - >   M o d e l s   w i t h   m a t e r i a l   n a m e   \ " r e p l a c e - m a t e r i a l \ "   n o t   f o u n d   i n :   "   +     ( f i l e n a m e F r o m P a t h   s ) )   n a m e :   l o g F i l e N a m e  
 	 	 	 	 c o n t i n u e  
 	 	 	 )  
 	 	 	  
 	 	 	 t m p   =   g e t M a t e r i a l s A n d P a t h s ( )  
 	 	 	 i f ( t m p [ 1 ]   = =   u n d e f i n e d )   d o   r e t u r n   (  
 	 	 	 	 l o g g i n g   ( " E r r o r   - - >   S c e n e :   "   +     ( f i l e n a m e F r o m P a t h   s )   +   " .   "   +   t m p [ 2 ] )   n a m e :   l o g F i l e N a m e  
 	 	 	 	 c o n t i n u e  
 	 	 	 )  
 	 	 	  
 	 	 	 - -   m a t e r i a l ,   n a m e ,   o b j e c t ,   p a t h  
 	 	 	 m a t s A n d P a t h s   =   t m p [ 1 ]  
 	 	 	  
 	 	 	 - -   m a t e r i a l ,   n a m e ,   o b j e c t ,   p a t h 	 	 	  
 	 	 	 f o r   i   i n   m a t s A n d P a t h s   d o   (  
 	 	 	 	 t a r g e t M a t e r i a l   =   i [ 1 ]  
 	 	 	 	 t a r g e t N a m e   =   i [ 2 ]  
 	 	 	 	 t a r g e t O b j   =   i [ 3 ]  
 	 	 	 	 t a r g e t P a t h   =   i [ 4 ]  
 	 	 	 	 	 	 	  
 	 	 	 	 p   =   t a r g e t P a t h 	 	 	 	  
 	 	 	 	 t e x t u r e s   =   g e t T e x t u r e s   p  
 	 	 	 	 b b   =   g e t B i t m a p s T o R e p l a c e   t a r g e t M a t e r i a l  
 	 	 	  
 	 	 	 	 - -   D i r e c t l y   r e p l a c e   m a t e r i a l  
 	 	 	 	 r e p l a c e I n s t a n c e s   l a s t R e p l a c e M a t e r i a l   t a r g e t M a t e r i a l  
 	 	 	 	 l a s t R e p l a c e M a t e r i a l   =   t a r g e t M a t e r i a l  
 	 	 	 	 	  
 	 	 	 	 i f ( t e x t u r e s . c o u n t   = =   0 )   d o   (  
 	 	 	 	 	 l o g g i n g   ( " E r r o r   - - >   T e x t u r e s   i n   f o l d e r   n o t   f o u n d :   "   +     p )   n a m e :   l o g F i l e N a m e  
 	 	 	 	 )  
 	 	 	 	    
 	 	 	 	 i f ( b b . c o u n t   = =   0 )   d o   (  
 	 	 	 	 	 l o g g i n g   ( " E r r o r   - - >   N o t   f o u n d   t e x t u r e s   t o   r e p l a c e   f o r   m a t e r i a l :   "   +     t a r g e t N a m e )   n a m e :   l o g F i l e N a m e  
 	 	 	 	 )  
 	 	 	 	  
 	 	 	 	 f o r   t   i n   t e x t u r e s   d o   (  
 	 	 	 	 	 f o r   b   i n   b b   d o   (  
 	 	 	 	 	 	 b . f i l e n a m e   =   t  
 	 	 	 	 	 	 i f ( c b x Q u a d r i f y U V W . c h e c k e d )   d o   s e t B i t m a p T i l i g   b  
 	 	 	 	 	 )  
 	 	 	 	 	  
 	 	 	 	 	 m a x N a m e   =   g e t F i l e n a m e F i l e   m a x F i l e N a m e  
 	 	 	 	 	 s e p a r a t e F o l d e r   =   " "  
 	 	 	 	 	 i f ( c b x U s e S e p a r a t e F o l d e r s . c h e c k e d )   d o   (  
 	 	 	 	 	 	 s e p a r a t e F o l d e r   =   m a x N a m e +   @ " \ "  
 	 	 	 	 	 	 m a k e D i r   ( e d t S a v e R e n d e r s T o . t e x t   +   s e p a r a t e F o l d e r )   a l l :   t r u e  
 	 	 	 	 	 )  
 	 	 	 	 	  
 	 	 	 	 	 t e x N a m e   =   g e t F i l e n a m e F i l e     t  
 	 	 	 	  
 	 	 	 	 	 f o r   c a m   i n   c a m s   d o   (  
 	 	 	 	 	 	 r e n d N a m e   =   m a x N a m e   +   " _ "   +   t a r g e t N a m e   +   " _ "   +   t e x N a m e   +   " _ "   +   c a m . n a m e   +   " . t i f " 	 	 	 	 	 	 	  
 	 	 	 	 	 	 o u t F i l e N a m e   =   e d t S a v e R e n d e r s T o . t e x t   +   s e p a r a t e F o l d e r   +   r e n d N a m e  
 	 	 	 	 	 	 v r . o u t p u t _ s p l i t f i l e n a m e   =   o u t F i l e N a m e  
 	 	 	 	 	 	 r e n d O u t p u t F i l e N a m e   =   o u t F i l e N a m e  
 	 	 	 	 	 	 d e l e t e F i l e   o u t F i l e N a m e  
 	 	 	 	 	 	  
 	 	 	 	 	 	 i f ( c a m   ! =   u n d e f i n e d )   d o   v i e w p o r t . s e t C a m e r a   c a m  
 	 	 	 	 	 	  
 	 	 	 	 	 	 l o g g i n g   ( " R e n d e r   - - >   "   +   o u t F i l e N a m e )   n a m e :   l o g F i l e N a m e  
 	 	 	 	 	 	 v f b C o n t r o l   # s h o w   t r u e  
 	 	 	 	 	 	 m a x   q u i c k   r e n d e r  
 	 	 	 	 	 	 v f b C o n t r o l   # s h o w   t r u e  
 	 	 	 	 	 	  
 	 	 	 	 	 	 i f   ( k e y b o a r d . e s c P r e s s e d )   d o   (  
 	 	 	 	 	 	 	 _ R E N D E R   =   f a l s e  
 	 	 	 	 	 	 	 r e t u r n   f a l s e  
 	 	 	 	 	 	 ) 	 	 	  
 	 	 	 	 	 )  
 	 	 	 	 	  
 	 	 	 	 	 i f ( _ R E N D E R   = =   f a l s e )   d o   e x i t  
 	 	 	 	 )  
 	 	 	 )  
 	 	 	  
 	 	 	 / * l o c a l   b   =   f i n d R e p l a c e T e x t u r e s ( )  
 	 	 	  
 	 	 	 f o r   t   i n   t e x t u r e L i s t   d o  
 	 	 	 (  
 	 	 	 	 f o r   c a m   i n   c a m s   d o  
 	 	 	 	 ( 	 	 	 	  
 	 	 	 	 	 n   =   s z S a v e T o   +   @ " \ "   +   g e t F i l e n a m e F i l e   s   +   " _ "   +   g e t F i l e n a m e F i l e   t   +   " _ "   +   c a m . n a m e   +   " . t i f "  
 	 	 	 	 	  
 	 	 	 	 	 i f ( c a m   ! =   u n d e f i n e d )   d o   v i e w p o r t . s e t C a m e r a   c a m  
 	 	 	 	 	 d e l e t e F i l e   n  
 	 	 	 	 	 r e n d S a v e F i l e   =   o n  
 	 	 	 	 	 r e n d O u t p u t F i l e N a m e   =   n  
 	 	 	 	 	 r e n d e r W i d t h   =   3 0 0 0  
 	 	 	 	 	 r e n d e r H e i g h t   =   1 9 2 0  
 	 	 	 	 	 v f b C o n t r o l   # s h o w   t r u e  
 	 	 	 	 	  
 	 	 	 	 	 - -   C l e a r   P r e v i o u s   f r a m e  
 	 	 	 	 	 v r . s y s t e m _ p r e v i o u s R e n d e r   =   5  
 	 	 	 	 	 - -   S e t   R e n d e r   M a s k   f o r   n o n e  
 	 	 	 	 	 v r . i m a g e S a m p l e r _ r e n d e r M a s k _ t y p e   =   0  
 	 	 	 	 	  
 	 	 	 	 	 - -   V r a y   O u t p u t   S e t t i n g s  
 	 	 	 	 	 v r . o u t p u t _ o n   =   t r u e  
 	 	 	 	 	 v r . o u t p u t _ u s e r a m   =   t r u e  
 	 	 	 	 	 v r . o u t p u t _ s a v e R a w F i l e   =   f a l s e  
 	 	 	 	 	 v r . o u t p u t _ s p l i t g b u f f e r   =   t r u e  
 	 	 	 	 	 v r . o u t p u t _ s p l i t R G B   =   t r u e  
 	 	 	 	 	 v r . o u t p u t _ s p l i t A l p h a   =   t r u e  
 	 	 	 	 	 v r . o u t p u t _ g e n p r e v i e w   =   t r u e  
 	 	 	 	 	  
 	 	 	 	 	 - -   S e t   a u t o   q u a l i t y   f o r   j p e g  
 	 	 	 	 	 - - J P E G . i j p e g i o . s e t Q u a l i t y   1 0 0  
 	 	 	 	 	 t i f . i t i f i o . s e t A l p h a   # t r u e  
 	 	 	 	 	 t i f . i t i f i o . s e t T y p e   # c o l o r  
 	 	 	 	 	 t i f . i t i f i o . s e t C o m p r e s s i o n   # n o n e  
 	 	 	 	 	 v r . o u t p u t _ s p l i t f i l e n a m e   =   n 	  
 	 	 	 	 	  
 	 	 	 	 	 - -   S e t   t e x t u r e s  
 	 	 	 	 	 f o r   j   i n   b   d o   ( 	  
 	 	 	 	 	 	 j . f i l e n a m e   =   t  
 	 	 	 	 	 	 i f ( c b x Q u a d r i f y U V W . c h e c k e d )   d o   s e t B i t m a p T i l i g   j  
 	 	 	 	 	 )  
 	 	 	 	 	  
 	 	 	 	 	 m a x   q u i c k   r e n d e r  
 	 	 	 	 	 v f b C o n t r o l   # s h o w   t r u e  
 	 	 	 	 	  
 	 	 	 	 	 i f   ( k e y b o a r d . e s c P r e s s e d )   d o   (  
 	 	 	 	 	 	 _ R E N D E R   =   f a l s e  
 	 	 	 	 	 	 r e t u r n   f a l s e  
 	 	 	 	 	 ) 	 	 	  
 	 	 	 	  
 	 	 	 	  
 	 	 	 	 i f ( _ R E N D E R   = =   f a l s e )   d o   e x i t  
 	 	 	 ) * /  
 	 	 	  
 	 	 	 i f ( _ R E N D E R   = =   f a l s e )   d o   e x i t  
 	 	 ) 	  
 	 )  
 ) 	  
  
 r o l l o u t   _ r A b o u t   " A b o u t "    
 (  
 	 l a b e l   l b l N a m e   " "    
 	 l a b e l   l b l V e r   " "    
 	  
 	 l a b e l   l b l A u t h o r   " "   h e i g h t :   3 0  
 	 l a b e l   l b l C o p y   " "     h e i g h t :   3 0  
 	 b u t t o n   b t n H e l p   " H e l p "   e n a b l e d :   f a l s e  
 	  
 	 f n   g e t H e l p   r u n :   f a l s e   =  
 	 (  
 	 	 s   =   g e t T h i s S c r i p t F i l e n a m e ( )  
 	 	 i   =   g e t S c r i p t I n f o   s  
 	 	 s z H e l p   =   ( g e t F i l e n a m e P a t h   s )   +   i [ 7 ]  
 	 	 i f ( d o e s F i l e E x i s t   s z H e l p )   d o   b t n H e l p . e n a b l e d   =   t r u e  
 	 	 	  
 	 	 i f ( r u n )   d o   S h e l l L a u n c h   s z H e l p   " "  
 	 )  
 	  
 	 o n   b t n H e l p   p r e s s e d   d o   g e t H e l p   r u n :   t r u e  
 	 	  
 	 o n   _ r A b o u t   o p e n   d o  
 	 ( 	 	  
 	 	 i   =   g e t S c r i p t I n f o   ( g e t T h i s S c r i p t F i l e n a m e ( ) )  
 	 	 	  
 	 	 l b l N a m e . c a p t i o n   =   i [ 1 ]  
 	 	 l b l A u t h o r . c a p t i o n   =   i [ 2 ]  
 	 	 l b l V e r . c a p t i o n   =   i [ 3 ]  
 	 	 l b l C o p y . c a p t i o n   =   i [ 6 ]  
 	 	  
 	 	 g e t H e l p ( )  
 	 )  
 )  
  
 a d d R o l l o u t   _ r S t e p 0   f A u t o m a t i o n S c r i p t   r o l l e d U p : f a l s e  
 a d d R o l l o u t   _ r A b o u t   f A u t o m a t i o n S c r i p t   r o l l e d U p : t r u e   