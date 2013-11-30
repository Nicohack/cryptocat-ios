//
//  TBBuddy.m
//  Cryptocat
//
//  Created by Thomas Balthazar on 24/10/13.
//  Copyright (c) 2013 Thomas Balthazar. All rights reserved.
//
//  This file is part of Cryptocat for iOS.
//
//  Cryptocat for iOS is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  Cryptocat for iOS is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with Cryptocat for iOS.  If not, see <http://www.gnu.org/licenses/>.
//

#import "TBBuddy.h"
#import "XMPPJID.h"

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@interface TBBuddy ()

@property (nonatomic, strong, readwrite) NSString *nickname;
@property (nonatomic, strong, readwrite) NSString *fullname;

- (BOOL)isEqualToBuddy:(TBBuddy *)buddy;

@end

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation TBBuddy

////////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithXMPPJID:(XMPPJID *)XMPPJID {
  if (self=[super init]) {
    _nickname = XMPPJID.resource;
    _fullname = XMPPJID.full;
    _roomName = XMPPJID.user;
    _chatFingerprint = nil;
    _groupChatFingerprint = nil;
  }
  
  return self;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Public Methods

////////////////////////////////////////////////////////////////////////////////////////////////////
- (XMPPJID *)XMPPJID {
  return [XMPPJID jidWithString:self.fullname];
}

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark NSObject Protocol

////////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)isEqual:(id)object {
  if (object==nil || ![object isKindOfClass:[self class]]) return NO;
  if (object==self) return YES;
  return [self isEqualToBuddy:object];
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (NSUInteger)hash {
  NSUInteger hash = 0;
  hash += [self.fullname hash];
  return hash;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Private Methods

////////////////////////////////////////////////////////////////////////////////////////////////////
- (BOOL)isEqualToBuddy:(TBBuddy *)buddy {
  if (buddy==self) return YES;
  if (![self.fullname isEqualToString:buddy.fullname]) return NO;
  return YES;
}

@end