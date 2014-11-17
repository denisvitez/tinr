//
//  PiratesGame.h
//  Pirates of the Rum sea
//
//  Created by tinr on 29/10/14.
//  Copyright (c) 2014 fri. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Retronator.Xni.Framework.h"
#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Xni.Framework.Graphics.h"
#import "Retronator.Xni.Framework.Input.Touch.h"

@interface PiratesGame : Game{
    GraphicsDeviceManager *graphics;
    SpriteBatch *spriteBatch;
    
    Texture2D *gameSprites;
    
    Rectangle *shipBounds;
    Rectangle *windBounds;
    Rectangle *mapBounds;
    Rectangle *wheelBounds;
    
    Vector2 *centre;
    Vector2 *shipPosition;
    Vector2 *windPosition;
    Vector2 *mapPosition;
    Vector2 *wheelPosition;
    
    Rectangle *inputArea;
    BOOL startOfGame;
}

@end
