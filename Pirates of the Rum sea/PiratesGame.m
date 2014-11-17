//
//  PiratesGame.m
//  Pirates of the Rum sea
//
//  Created by tinr on 29/10/14.
//  Copyright (c) 2014 fri. All rights reserved.
//

#import "PiratesGame.h"

@implementation PiratesGame

-(id)init{
    self = [super init];
    if(self){
        graphics = [[GraphicsDeviceManager alloc] initWithGame:self];
        shipBounds = [[Rectangle alloc] initWithX:0 y:0 width:513 height:146];
        windBounds = [[Rectangle alloc] initWithX:52 y:500 width:200 height:174];
        wheelBounds = [[Rectangle alloc] initWithX:561 y:340 width:146 height:125];
        mapBounds = [[Rectangle alloc] initWithX:300 y:480 width:205 height:227];
        inputArea = [[Rectangle alloc] initWithX:0 y:0 width:self.graphicsDevice.viewport.width height:self.graphicsDevice.viewport.height];
        startOfGame = NO;
    }
    return self;
}

-(void)loadContent{
    // load textures
    gameSprites = [self.content load:@"gameSprites"];
}

-(void)initialize{
    spriteBatch = [[SpriteBatch alloc] initWithGraphicsDevice:self.graphicsDevice];
    
    centre = [[Vector2 vectorWithX:self.graphicsDevice.viewport.width/2 y:self.graphicsDevice.viewport.height/2] retain];
    shipPosition = [[Vector2 vectorWithX:(self.graphicsDevice.viewport.width/2)-(shipBounds.width/2) y:(self.graphicsDevice.viewport.height/2)-(shipBounds.height/2)] retain];
    windPosition = [[Vector2 vectorWithX:0 y:0] retain];
    wheelPosition = [[Vector2 vectorWithX:0 y:self.graphicsDevice.viewport.height-wheelBounds.height] retain];
    mapPosition = [[Vector2 vectorWithX:self.graphicsDevice.viewport.width-mapBounds.width y:0] retain];
    [super initialize];
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    TouchCollection *touches = [[TouchPanel getInstance] getState];
    BOOL touchesInInputArea = NO;
    for (TouchLocation *touch in touches) {
        if (touch.position.x > shipPosition.x && touch.position.x < shipPosition.x+shipBounds.width && touch.position.y > shipPosition.y && touch.position.y < shipPosition.y+shipBounds.height){
            touchesInInputArea = YES;
        }
        startOfGame = YES;
    }
    if (touchesInInputArea) {
        if (gameTime.elapsedGameTime > 0) {
            shipPosition.x = shipPosition.x + (0.05/gameTime.elapsedGameTime);
            //shipPosition.y = shipPosition.y + (0.01/gameTime.elapsedGameTime);
        }
    }
    if(startOfGame) {
        windPosition.x = windPosition.x + (0.1f/gameTime.elapsedGameTime);
        windPosition.y = windPosition.y + (0.1f/gameTime.elapsedGameTime);
    }
}

- (void)drawWithGameTime:(GameTime *)gameTime {
    [self.graphicsDevice clearWithColor:[Color lightBlue]];
    [spriteBatch begin];
    [spriteBatch draw:gameSprites to:shipPosition fromRectangle:shipBounds tintWithColor:[Color white] rotation:0 origin:[Vector2 vectorWithX:0 y:0] scaleUniform:1 effects:SpriteEffectsNone layerDepth:0];
    [spriteBatch draw:gameSprites to:windPosition fromRectangle:windBounds tintWithColor:[Color white] rotation:0 origin:[Vector2 vectorWithX:0 y:0] scaleUniform:1 effects:SpriteEffectsNone layerDepth:0];
    [spriteBatch draw:gameSprites to:wheelPosition fromRectangle:wheelBounds tintWithColor:[Color white] rotation:0 origin:[Vector2 vectorWithX:0 y:0] scaleUniform:1 effects:SpriteEffectsNone layerDepth:0];
    [spriteBatch draw:gameSprites to:mapPosition fromRectangle:mapBounds tintWithColor:[Color white] rotation:0 origin:[Vector2 vectorWithX:0 y:0] scaleUniform:1 effects:SpriteEffectsNone layerDepth:0];
    [spriteBatch end];
    [super drawWithGameTime:gameTime];
}

@end
