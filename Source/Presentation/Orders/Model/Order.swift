//
//  OrderList.swift
//  UDEX
//
//  Created by Abai Abakirov on 12/18/19.
//  Copyright © 2019 MakeUseOf. All rights reserved.
//

import SwiftUI

struct Order: Identifiable {
  var id: String = UUID().uuidString
  
  let makerAmount: Decimal
  let takerAmount: Decimal
  
  init(maker: Decimal, taker: Decimal) {
    makerAmount = maker
    takerAmount = taker
  }
}
